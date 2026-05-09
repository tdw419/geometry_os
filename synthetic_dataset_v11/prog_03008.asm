; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (60, 177) with width 119 and height 56. Then Places a magenta circle of radius 13 at center (51, 193).
; PLAN: r0=60(x), r1=177(y), r2=119(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=51(x), r1=193(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (60, 177) with width 119 and height 56.
; PLAN: r0=60(x), r1=177(y), r2=119(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 177
LDI r2, 119
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 13 at center (51, 193).
; PLAN: r0=51(x), r1=193(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 193
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
