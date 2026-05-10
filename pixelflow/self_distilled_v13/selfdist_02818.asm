; DESCRIPTION: Draws a cyan rectangle at (116, 161) with width 71 and height 63.
; PLAN: r0=116(x), r1=161(y), r2=71(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 161
LDI r2, 71
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
