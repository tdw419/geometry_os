; DESCRIPTION: Draws a cyan rectangle at (278, 76) with width 77 and height 99.
; PLAN: r0=278(x), r1=76(y), r2=77(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 76
LDI r2, 77
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
