; DESCRIPTION: Draws a cyan rectangle at (337, 9) with width 79 and height 85.
; PLAN: r0=337(x), r1=9(y), r2=79(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 9
LDI r2, 79
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
