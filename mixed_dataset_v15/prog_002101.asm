; DESCRIPTION: Draws a purple rectangle at (208, 93) with width 58 and height 44.
; PLAN: r0=208(x), r1=93(y), r2=58(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 93
LDI r2, 58
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
