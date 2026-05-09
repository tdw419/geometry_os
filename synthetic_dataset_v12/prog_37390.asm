; DESCRIPTION: Draws a cyan rectangle at (407, 9) with width 76 and height 87.
; PLAN: r0=407(x), r1=9(y), r2=76(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 9
LDI r2, 76
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
