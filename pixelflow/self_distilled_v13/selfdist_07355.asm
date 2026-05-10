; DESCRIPTION: Draws a yellow rectangle at (125, 171) with width 119 and height 71.
; PLAN: r0=125(x), r1=171(y), r2=119(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 171
LDI r2, 119
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
