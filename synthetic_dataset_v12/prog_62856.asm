; DESCRIPTION: Draws a cyan rectangle at (229, 171) with width 95 and height 55.
; PLAN: r0=229(x), r1=171(y), r2=95(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 171
LDI r2, 95
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
