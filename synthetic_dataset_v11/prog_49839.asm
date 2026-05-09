; DESCRIPTION: Composite: . Then Renders a orange disk with center (66, 100) and radius 61. Then Draws a purple rectangle at (206, 146) with width 33 and height 99.
; PLAN: r0=66(x), r1=100(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=206(x), r1=146(y), r2=33(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (66, 100) and radius 61.
; PLAN: r0=66(x), r1=100(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 100
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (206, 146) with width 33 and height 99.
; PLAN: r0=206(x), r1=146(y), r2=33(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 146
LDI r2, 33
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
