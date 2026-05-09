; DESCRIPTION: Draws a black rectangle at (27, 62) with width 33 and height 10.
; PLAN: r0=27(x), r1=62(y), r2=33(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 62
LDI r2, 33
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
