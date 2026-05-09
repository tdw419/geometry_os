; DESCRIPTION: Draws a yellow rectangle at (178, 82) with width 72 and height 114.
; PLAN: r0=178(x), r1=82(y), r2=72(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 82
LDI r2, 72
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
