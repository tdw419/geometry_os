; DESCRIPTION: Draws a black rectangle at (27, 79) with width 105 and height 40.
; PLAN: r0=27(x), r1=79(y), r2=105(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 79
LDI r2, 105
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
