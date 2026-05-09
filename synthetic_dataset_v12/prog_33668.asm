; DESCRIPTION: Draws a cyan rectangle at (131, 132) with width 78 and height 79.
; PLAN: r0=131(x), r1=132(y), r2=78(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 132
LDI r2, 78
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
