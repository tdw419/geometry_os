; DESCRIPTION: Draws a cyan rectangle at (166, 135) with width 110 and height 76.
; PLAN: r0=166(x), r1=135(y), r2=110(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 135
LDI r2, 110
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
