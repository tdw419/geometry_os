; DESCRIPTION: Draws a cyan rectangle at (229, 38) with width 35 and height 79.
; PLAN: r0=229(x), r1=38(y), r2=35(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 38
LDI r2, 35
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
