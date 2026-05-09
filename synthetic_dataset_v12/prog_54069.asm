; DESCRIPTION: Draws a green rectangle at (220, 52) with width 79 and height 86.
; PLAN: r0=220(x), r1=52(y), r2=79(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 52
LDI r2, 79
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
