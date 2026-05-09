; DESCRIPTION: Draws a blue rectangle at (6, 82) with width 109 and height 99.
; PLAN: r0=6(x), r1=82(y), r2=109(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 82
LDI r2, 109
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
