; DESCRIPTION: Draws a black rectangle at (72, 127) with width 23 and height 94.
; PLAN: r0=72(x), r1=127(y), r2=23(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 127
LDI r2, 23
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
