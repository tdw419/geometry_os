; DESCRIPTION: Draws a cyan rectangle at (36, 63) with width 44 and height 75.
; PLAN: r0=36(x), r1=63(y), r2=44(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 63
LDI r2, 44
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
