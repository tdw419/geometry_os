; DESCRIPTION: Draws a blue rectangle at (269, 120) with width 107 and height 85.
; PLAN: r0=269(x), r1=120(y), r2=107(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 120
LDI r2, 107
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
