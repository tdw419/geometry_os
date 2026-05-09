; DESCRIPTION: Draws a cyan rectangle at (100, 128) with width 106 and height 31.
; PLAN: r0=100(x), r1=128(y), r2=106(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 128
LDI r2, 106
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
