; DESCRIPTION: Draws a cyan rectangle at (282, 15) with width 87 and height 83.
; PLAN: r0=282(x), r1=15(y), r2=87(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 15
LDI r2, 87
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
