; DESCRIPTION: Draws a cyan rectangle at (132, 77) with width 77 and height 89.
; PLAN: r0=132(x), r1=77(y), r2=77(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 77
LDI r2, 77
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
