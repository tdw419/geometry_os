; DESCRIPTION: Draws a orange rectangle at (191, 111) with width 48 and height 106.
; PLAN: r0=191(x), r1=111(y), r2=48(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 111
LDI r2, 48
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
