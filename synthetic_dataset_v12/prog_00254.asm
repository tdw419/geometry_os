; DESCRIPTION: Draws a red rectangle at (390, 63) with width 86 and height 120.
; PLAN: r0=390(x), r1=63(y), r2=86(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 63
LDI r2, 86
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
