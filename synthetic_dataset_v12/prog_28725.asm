; DESCRIPTION: Draws a yellow rectangle at (462, 213) with width 33 and height 18.
; PLAN: r0=462(x), r1=213(y), r2=33(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 213
LDI r2, 33
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
