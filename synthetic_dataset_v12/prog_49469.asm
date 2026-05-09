; DESCRIPTION: Draws a cyan rectangle at (56, 9) with width 77 and height 79.
; PLAN: r0=56(x), r1=9(y), r2=77(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 9
LDI r2, 77
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
