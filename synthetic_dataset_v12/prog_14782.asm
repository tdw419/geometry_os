; DESCRIPTION: Draws a orange rectangle at (240, 98) with width 115 and height 46.
; PLAN: r0=240(x), r1=98(y), r2=115(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 98
LDI r2, 115
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
