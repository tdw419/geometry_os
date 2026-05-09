; DESCRIPTION: Composite: . Then Places a black 72x46 rectangle at position (183, 112). Then Renders a green line between points (72, 101) and (49, 135).
; PLAN: r0=183(x), r1=112(y), r2=72(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x1), r1=101(y1), r2=49(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 72x46 rectangle at position (183, 112).
; PLAN: r0=183(x), r1=112(y), r2=72(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 112
LDI r2, 72
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green line between points (72, 101) and (49, 135).
; PLAN: r0=72(x1), r1=101(y1), r2=49(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 101
LDI r2, 49
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
