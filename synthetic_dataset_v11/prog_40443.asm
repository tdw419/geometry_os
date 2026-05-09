; DESCRIPTION: Draws a cyan rectangle at (57, 37) with width 99 and height 116.
; PLAN: r0=57(x), r1=37(y), r2=99(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 37
LDI r2, 99
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
