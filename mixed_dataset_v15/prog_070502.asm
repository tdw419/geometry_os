; DESCRIPTION: Draws a purple rectangle at (286, 63) with width 109 and height 57.
; PLAN: r0=286(x), r1=63(y), r2=109(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 63
LDI r2, 109
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
