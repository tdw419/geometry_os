; DESCRIPTION: Draws a cyan rectangle at (246, 65) with width 35 and height 76.
; PLAN: r0=246(x), r1=65(y), r2=35(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 65
LDI r2, 35
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
