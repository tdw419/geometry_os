; DESCRIPTION: Draws a yellow rectangle at (154, 127) with width 79 and height 81.
; PLAN: r0=154(x), r1=127(y), r2=79(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 127
LDI r2, 79
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
