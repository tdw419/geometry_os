; DESCRIPTION: Draws a yellow rectangle at (385, 159) with width 33 and height 27.
; PLAN: r0=385(x), r1=159(y), r2=33(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 159
LDI r2, 33
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
