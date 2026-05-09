; DESCRIPTION: Composite: . Then Draws a blue rectangle at (224, 26) with width 18 and height 66. Then Renders a blue line between points (222, 43) and (182, 172).
; PLAN: r0=224(x), r1=26(y), r2=18(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=222(x1), r1=43(y1), r2=182(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (224, 26) with width 18 and height 66.
; PLAN: r0=224(x), r1=26(y), r2=18(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 26
LDI r2, 18
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (222, 43) and (182, 172).
; PLAN: r0=222(x1), r1=43(y1), r2=182(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 43
LDI r2, 182
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
