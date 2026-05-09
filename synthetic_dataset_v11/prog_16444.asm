; DESCRIPTION: Draws a black rectangle at (10, 127) with width 16 and height 98.
; PLAN: r0=10(x), r1=127(y), r2=16(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 127
LDI r2, 16
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
