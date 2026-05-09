; DESCRIPTION: Draws a yellow rectangle at (66, 48) with width 47 and height 55.
; PLAN: r0=66(x), r1=48(y), r2=47(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 48
LDI r2, 47
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
