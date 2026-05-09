; DESCRIPTION: Draws a green rectangle at (138, 22) with width 82 and height 48.
; PLAN: r0=138(x), r1=22(y), r2=82(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 22
LDI r2, 82
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
