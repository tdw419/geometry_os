; DESCRIPTION: Draws a purple rectangle at (42, 127) with width 48 and height 103.
; PLAN: r0=42(x), r1=127(y), r2=48(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 127
LDI r2, 48
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
