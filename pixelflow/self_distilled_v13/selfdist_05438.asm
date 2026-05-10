; DESCRIPTION: Draws a cyan rectangle at (127, 52) with width 27 and height 90.
; PLAN: r0=127(x), r1=52(y), r2=27(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 52
LDI r2, 27
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
