; DESCRIPTION: Draws a cyan rectangle at (448, 56) with width 26 and height 79.
; PLAN: r0=448(x), r1=56(y), r2=26(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 56
LDI r2, 26
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
