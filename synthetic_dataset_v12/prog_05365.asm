; DESCRIPTION: Draws a black rectangle at (273, 174) with width 40 and height 82.
; PLAN: r0=273(x), r1=174(y), r2=40(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 174
LDI r2, 40
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
