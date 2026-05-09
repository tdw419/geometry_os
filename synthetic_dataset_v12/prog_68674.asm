; DESCRIPTION: Draws a cyan rectangle at (203, 162) with width 90 and height 80.
; PLAN: r0=203(x), r1=162(y), r2=90(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 162
LDI r2, 90
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
