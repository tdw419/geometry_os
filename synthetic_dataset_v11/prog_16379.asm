; DESCRIPTION: Draws a yellow rectangle at (151, 5) with width 91 and height 117.
; PLAN: r0=151(x), r1=5(y), r2=91(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 5
LDI r2, 91
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
