; DESCRIPTION: Draws a yellow rectangle at (21, 138) with width 36 and height 16.
; PLAN: r0=21(x), r1=138(y), r2=36(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 138
LDI r2, 36
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
