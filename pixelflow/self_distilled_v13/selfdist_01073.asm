; DESCRIPTION: Draws a blue rectangle at (245, 179) with width 107 and height 85.
; PLAN: r0=245(x), r1=179(y), r2=107(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 179
LDI r2, 107
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
