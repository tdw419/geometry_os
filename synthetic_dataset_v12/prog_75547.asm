; DESCRIPTION: Draws a black rectangle at (95, 44) with width 87 and height 29.
; PLAN: r0=95(x), r1=44(y), r2=87(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 44
LDI r2, 87
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
