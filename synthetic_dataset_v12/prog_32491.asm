; DESCRIPTION: Draws a black rectangle at (290, 151) with width 33 and height 56.
; PLAN: r0=290(x), r1=151(y), r2=33(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 151
LDI r2, 33
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
