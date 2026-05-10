; DESCRIPTION: Draws a yellow rectangle at (309, 148) with width 82 and height 80.
; PLAN: r0=309(x), r1=148(y), r2=82(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 148
LDI r2, 82
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
