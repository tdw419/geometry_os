; DESCRIPTION: Draws a purple rectangle at (346, 93) with width 64 and height 65.
; PLAN: r0=346(x), r1=93(y), r2=64(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 93
LDI r2, 64
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
