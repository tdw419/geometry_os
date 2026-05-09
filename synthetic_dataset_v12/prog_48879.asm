; DESCRIPTION: Draws a cyan rectangle at (135, 218) with width 91 and height 19.
; PLAN: r0=135(x), r1=218(y), r2=91(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 218
LDI r2, 91
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
