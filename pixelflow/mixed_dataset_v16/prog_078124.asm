; DESCRIPTION: Draws a yellow rectangle at (85, 23) with width 109 and height 39.
; PLAN: r0=85(x), r1=23(y), r2=109(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 23
LDI r2, 109
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
