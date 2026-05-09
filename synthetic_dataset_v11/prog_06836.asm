; DESCRIPTION: Draws a cyan rectangle at (68, 52) with width 116 and height 28.
; PLAN: r0=68(x), r1=52(y), r2=116(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 52
LDI r2, 116
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
