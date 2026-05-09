; DESCRIPTION: Draws a cyan rectangle at (79, 203) with width 96 and height 35.
; PLAN: r0=79(x), r1=203(y), r2=96(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 203
LDI r2, 96
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
