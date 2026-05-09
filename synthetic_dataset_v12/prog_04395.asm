; DESCRIPTION: Draws a cyan rectangle at (320, 226) with width 84 and height 27.
; PLAN: r0=320(x), r1=226(y), r2=84(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 226
LDI r2, 84
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
