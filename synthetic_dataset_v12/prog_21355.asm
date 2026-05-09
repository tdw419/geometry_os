; DESCRIPTION: Draws a yellow rectangle at (364, 202) with width 64 and height 29.
; PLAN: r0=364(x), r1=202(y), r2=64(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 202
LDI r2, 64
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
