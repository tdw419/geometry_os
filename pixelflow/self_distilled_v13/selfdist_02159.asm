; DESCRIPTION: Draws a cyan rectangle at (261, 95) with width 97 and height 16.
; PLAN: r0=261(x), r1=95(y), r2=97(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 95
LDI r2, 97
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
