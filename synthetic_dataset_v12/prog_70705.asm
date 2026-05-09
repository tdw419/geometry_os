; DESCRIPTION: Draws a yellow rectangle at (44, 128) with width 86 and height 65.
; PLAN: r0=44(x), r1=128(y), r2=86(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 128
LDI r2, 86
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
