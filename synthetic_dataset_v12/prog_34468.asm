; DESCRIPTION: Draws a black rectangle at (25, 127) with width 120 and height 23.
; PLAN: r0=25(x), r1=127(y), r2=120(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 127
LDI r2, 120
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
