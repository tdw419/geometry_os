; DESCRIPTION: Draws a cyan rectangle at (110, 194) with width 79 and height 16.
; PLAN: r0=110(x), r1=194(y), r2=79(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 194
LDI r2, 79
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
