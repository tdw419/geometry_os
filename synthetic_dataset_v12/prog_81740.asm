; DESCRIPTION: Draws a black rectangle at (444, 53) with width 29 and height 57.
; PLAN: r0=444(x), r1=53(y), r2=29(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 53
LDI r2, 29
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
