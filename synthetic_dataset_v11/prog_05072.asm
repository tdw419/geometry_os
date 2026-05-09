; DESCRIPTION: Composite: . Then Renders a orange disk with center (42, 179) and radius 30. Then Draws a magenta rectangle at (160, 135) with width 51 and height 25.
; PLAN: r0=42(x), r1=179(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x), r1=135(y), r2=51(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (42, 179) and radius 30.
; PLAN: r0=42(x), r1=179(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 179
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (160, 135) with width 51 and height 25.
; PLAN: r0=160(x), r1=135(y), r2=51(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 135
LDI r2, 51
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
