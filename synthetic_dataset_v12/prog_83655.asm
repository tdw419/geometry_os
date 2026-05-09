; DESCRIPTION: Draws a purple rectangle at (193, 103) with width 68 and height 45.
; PLAN: r0=193(x), r1=103(y), r2=68(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 103
LDI r2, 68
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
