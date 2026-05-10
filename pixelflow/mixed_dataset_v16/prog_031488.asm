; DESCRIPTION: Draws a green rectangle at (436, 21) with width 33 and height 36.
; PLAN: r0=436(x), r1=21(y), r2=33(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 21
LDI r2, 33
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
