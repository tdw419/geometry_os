; DESCRIPTION: Draws a blue rectangle at (330, 128) with width 111 and height 98.
; PLAN: r0=330(x), r1=128(y), r2=111(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 128
LDI r2, 111
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
