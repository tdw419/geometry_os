; DESCRIPTION: Draws a cyan rectangle at (71, 3) with width 86 and height 89.
; PLAN: r0=71(x), r1=3(y), r2=86(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 3
LDI r2, 86
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
