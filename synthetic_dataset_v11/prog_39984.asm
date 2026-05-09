; DESCRIPTION: Composite: . Then Renders a white line between points (77, 123) and (123, 78). Then Renders a blue box of size 106x78 starting at (130, 142).
; PLAN: r0=77(x1), r1=123(y1), r2=123(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=130(x), r1=142(y), r2=106(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (77, 123) and (123, 78).
; PLAN: r0=77(x1), r1=123(y1), r2=123(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 123
LDI r2, 123
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 106x78 starting at (130, 142).
; PLAN: r0=130(x), r1=142(y), r2=106(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 142
LDI r2, 106
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
