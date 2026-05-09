; DESCRIPTION: Draws a purple rectangle at (329, 195) with width 27 and height 24.
; PLAN: r0=329(x), r1=195(y), r2=27(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 195
LDI r2, 27
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
