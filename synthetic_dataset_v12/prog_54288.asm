; DESCRIPTION: Draws a yellow rectangle at (330, 194) with width 117 and height 18.
; PLAN: r0=330(x), r1=194(y), r2=117(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 194
LDI r2, 117
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
