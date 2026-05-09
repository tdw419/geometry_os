; DESCRIPTION: Draws a cyan rectangle at (194, 23) with width 16 and height 106.
; PLAN: r0=194(x), r1=23(y), r2=16(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 23
LDI r2, 16
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
