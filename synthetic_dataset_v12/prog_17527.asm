; DESCRIPTION: Draws a cyan rectangle at (127, 12) with width 89 and height 44.
; PLAN: r0=127(x), r1=12(y), r2=89(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 12
LDI r2, 89
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
