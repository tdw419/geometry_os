; DESCRIPTION: Draws a yellow rectangle at (179, 2) with width 113 and height 117.
; PLAN: r0=179(x), r1=2(y), r2=113(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 2
LDI r2, 113
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
