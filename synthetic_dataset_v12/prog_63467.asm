; DESCRIPTION: Draws a yellow rectangle at (273, 8) with width 47 and height 49.
; PLAN: r0=273(x), r1=8(y), r2=47(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 8
LDI r2, 47
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
