; DESCRIPTION: Draws a purple rectangle at (127, 120) with width 23 and height 10.
; PLAN: r0=127(x), r1=120(y), r2=23(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 120
LDI r2, 23
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
