; DESCRIPTION: Draws a green rectangle at (223, 112) with width 82 and height 108.
; PLAN: r0=223(x), r1=112(y), r2=82(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 112
LDI r2, 82
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
