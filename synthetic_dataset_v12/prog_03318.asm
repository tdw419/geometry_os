; DESCRIPTION: Draws a black rectangle at (112, 243) with width 63 and height 10.
; PLAN: r0=112(x), r1=243(y), r2=63(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 243
LDI r2, 63
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
