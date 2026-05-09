; DESCRIPTION: Draws a red rectangle at (275, 127) with width 99 and height 106.
; PLAN: r0=275(x), r1=127(y), r2=99(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 127
LDI r2, 99
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
