; DESCRIPTION: Draws a cyan rectangle at (208, 55) with width 26 and height 49.
; PLAN: r0=208(x), r1=55(y), r2=26(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 55
LDI r2, 26
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
