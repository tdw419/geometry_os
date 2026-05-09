; DESCRIPTION: Draws a cyan rectangle at (81, 71) with width 18 and height 19.
; PLAN: r0=81(x), r1=71(y), r2=18(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 71
LDI r2, 18
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
