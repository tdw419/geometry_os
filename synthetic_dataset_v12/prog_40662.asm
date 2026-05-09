; DESCRIPTION: Draws a yellow rectangle at (436, 82) with width 19 and height 111.
; PLAN: r0=436(x), r1=82(y), r2=19(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 82
LDI r2, 19
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
