; DESCRIPTION: Draws a cyan rectangle at (194, 37) with width 94 and height 71.
; PLAN: r0=194(x), r1=37(y), r2=94(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 37
LDI r2, 94
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
