; DESCRIPTION: Composite: . Then Places a yellow circle of radius 51 at center (195, 113). Then Draws a orange rectangle at (128, 179) with width 60 and height 57.
; PLAN: r0=195(x), r1=113(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x), r1=179(y), r2=60(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 51 at center (195, 113).
; PLAN: r0=195(x), r1=113(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 113
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange rectangle at (128, 179) with width 60 and height 57.
; PLAN: r0=128(x), r1=179(y), r2=60(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 179
LDI r2, 60
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
