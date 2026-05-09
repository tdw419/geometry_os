; DESCRIPTION: Draws a yellow rectangle at (82, 34) with width 63 and height 44.
; PLAN: r0=82(x), r1=34(y), r2=63(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 34
LDI r2, 63
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
