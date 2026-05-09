; DESCRIPTION: Draws a red rectangle at (453, 17) with width 26 and height 103.
; PLAN: r0=453(x), r1=17(y), r2=26(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 17
LDI r2, 26
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
