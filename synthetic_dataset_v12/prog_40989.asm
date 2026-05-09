; DESCRIPTION: Draws a yellow rectangle at (226, 91) with width 25 and height 27.
; PLAN: r0=226(x), r1=91(y), r2=25(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 91
LDI r2, 25
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
