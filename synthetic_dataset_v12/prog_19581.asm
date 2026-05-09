; DESCRIPTION: Draws a purple rectangle at (168, 71) with width 10 and height 55.
; PLAN: r0=168(x), r1=71(y), r2=10(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 71
LDI r2, 10
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
