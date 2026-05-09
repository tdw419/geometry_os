; DESCRIPTION: Draws a yellow rectangle at (174, 180) with width 18 and height 15.
; PLAN: r0=174(x), r1=180(y), r2=18(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 180
LDI r2, 18
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
