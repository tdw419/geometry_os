; DESCRIPTION: Composite: . Then Renders a cyan box of size 47x50 starting at (43, 72). Then Places a black line segment connecting (78, 101) to (76, 53).
; PLAN: r0=43(x), r1=72(y), r2=47(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=78(x1), r1=101(y1), r2=76(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 47x50 starting at (43, 72).
; PLAN: r0=43(x), r1=72(y), r2=47(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 72
LDI r2, 47
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (78, 101) to (76, 53).
; PLAN: r0=78(x1), r1=101(y1), r2=76(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 101
LDI r2, 76
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
