; DESCRIPTION: Draws a cyan rectangle at (359, 172) with width 57 and height 16.
; PLAN: r0=359(x), r1=172(y), r2=57(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 172
LDI r2, 57
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
