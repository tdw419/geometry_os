; DESCRIPTION: Draws a yellow rectangle at (16, 46) with width 97 and height 103.
; PLAN: r0=16(x), r1=46(y), r2=97(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 46
LDI r2, 97
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
