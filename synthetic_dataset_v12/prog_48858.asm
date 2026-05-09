; DESCRIPTION: Draws a yellow rectangle at (141, 63) with width 82 and height 59.
; PLAN: r0=141(x), r1=63(y), r2=82(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 63
LDI r2, 82
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
