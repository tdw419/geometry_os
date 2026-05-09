; DESCRIPTION: Draws a cyan rectangle at (112, 172) with width 70 and height 83.
; PLAN: r0=112(x), r1=172(y), r2=70(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 172
LDI r2, 70
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
