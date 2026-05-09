; DESCRIPTION: Draws a black rectangle at (350, 128) with width 44 and height 100.
; PLAN: r0=350(x), r1=128(y), r2=44(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 128
LDI r2, 44
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
