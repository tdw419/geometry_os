; DESCRIPTION: Draws a black rectangle at (321, 3) with width 111 and height 57.
; PLAN: r0=321(x), r1=3(y), r2=111(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 3
LDI r2, 111
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
