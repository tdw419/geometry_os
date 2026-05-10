; DESCRIPTION: Draws a yellow rectangle at (269, 162) with width 39 and height 34.
; PLAN: r0=269(x), r1=162(y), r2=39(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 162
LDI r2, 39
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
