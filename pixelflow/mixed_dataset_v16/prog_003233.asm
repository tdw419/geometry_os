; DESCRIPTION: Draws a cyan rectangle at (250, 127) with width 99 and height 90.
; PLAN: r0=250(x), r1=127(y), r2=99(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 127
LDI r2, 99
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
