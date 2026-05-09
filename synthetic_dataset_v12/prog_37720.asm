; DESCRIPTION: Draws a yellow rectangle at (97, 213) with width 103 and height 16.
; PLAN: r0=97(x), r1=213(y), r2=103(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 213
LDI r2, 103
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
