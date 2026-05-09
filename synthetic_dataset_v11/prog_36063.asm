; DESCRIPTION: Draws a yellow rectangle at (137, 61) with width 64 and height 71.
; PLAN: r0=137(x), r1=61(y), r2=64(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 61
LDI r2, 64
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
