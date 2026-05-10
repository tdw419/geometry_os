; DESCRIPTION: Draws a yellow rectangle at (406, 139) with width 64 and height 33.
; PLAN: r0=406(x), r1=139(y), r2=64(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 139
LDI r2, 64
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
