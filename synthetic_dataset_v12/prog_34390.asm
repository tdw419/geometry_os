; DESCRIPTION: Draws a orange rectangle at (182, 59) with width 51 and height 98.
; PLAN: r0=182(x), r1=59(y), r2=51(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 59
LDI r2, 51
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
