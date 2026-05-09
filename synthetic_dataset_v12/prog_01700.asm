; DESCRIPTION: Draws a black rectangle at (237, 111) with width 111 and height 108.
; PLAN: r0=237(x), r1=111(y), r2=111(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 111
LDI r2, 111
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
