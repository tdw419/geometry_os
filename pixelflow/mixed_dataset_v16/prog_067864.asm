; DESCRIPTION: Draws a yellow rectangle at (96, 33) with width 107 and height 103.
; PLAN: r0=96(x), r1=33(y), r2=107(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 33
LDI r2, 107
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
