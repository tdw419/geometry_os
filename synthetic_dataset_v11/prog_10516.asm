; DESCRIPTION: Draws a cyan rectangle at (116, 193) with width 37 and height 36.
; PLAN: r0=116(x), r1=193(y), r2=37(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 193
LDI r2, 37
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
