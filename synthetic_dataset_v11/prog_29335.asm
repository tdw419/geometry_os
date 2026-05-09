; DESCRIPTION: Draws a cyan rectangle at (221, 5) with width 13 and height 116.
; PLAN: r0=221(x), r1=5(y), r2=13(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 5
LDI r2, 13
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
