; DESCRIPTION: Draws a yellow rectangle at (106, 149) with width 90 and height 48.
; PLAN: r0=106(x), r1=149(y), r2=90(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 149
LDI r2, 90
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
