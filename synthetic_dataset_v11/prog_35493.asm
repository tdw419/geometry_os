; DESCRIPTION: Draws a cyan rectangle at (157, 116) with width 87 and height 55.
; PLAN: r0=157(x), r1=116(y), r2=87(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 116
LDI r2, 87
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
