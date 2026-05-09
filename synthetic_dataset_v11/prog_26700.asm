; DESCRIPTION: Composite: . Then Draws a white rectangle at (36, 120) with width 11 and height 89. Then Renders a yellow line between points (245, 105) and (37, 28).
; PLAN: r0=36(x), r1=120(y), r2=11(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=245(x1), r1=105(y1), r2=37(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (36, 120) with width 11 and height 89.
; PLAN: r0=36(x), r1=120(y), r2=11(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 120
LDI r2, 11
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (245, 105) and (37, 28).
; PLAN: r0=245(x1), r1=105(y1), r2=37(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 105
LDI r2, 37
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
