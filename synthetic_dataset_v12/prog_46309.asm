; DESCRIPTION: Draws a black rectangle at (278, 180) with width 27 and height 29.
; PLAN: r0=278(x), r1=180(y), r2=27(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 180
LDI r2, 27
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
