; DESCRIPTION: Draws a yellow rectangle at (186, 4) with width 86 and height 73.
; PLAN: r0=186(x), r1=4(y), r2=86(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 4
LDI r2, 86
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
