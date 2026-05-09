; DESCRIPTION: Draws a yellow rectangle at (304, 115) with width 56 and height 10.
; PLAN: r0=304(x), r1=115(y), r2=56(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 115
LDI r2, 56
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
