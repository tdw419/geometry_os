; DESCRIPTION: Draws a yellow rectangle at (18, 33) with width 46 and height 109.
; PLAN: r0=18(x), r1=33(y), r2=46(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 33
LDI r2, 46
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
