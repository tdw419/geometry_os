; DESCRIPTION: Composite: . Then Renders a green box of size 37x92 starting at (10, 88). Then Renders a white line between points (189, 111) and (110, 67).
; PLAN: r0=10(x), r1=88(y), r2=37(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=189(x1), r1=111(y1), r2=110(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 37x92 starting at (10, 88).
; PLAN: r0=10(x), r1=88(y), r2=37(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 88
LDI r2, 37
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (189, 111) and (110, 67).
; PLAN: r0=189(x1), r1=111(y1), r2=110(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 111
LDI r2, 110
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
