; DESCRIPTION: Draws a green rectangle at (95, 131) with width 72 and height 94.
; PLAN: r0=95(x), r1=131(y), r2=72(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 131
LDI r2, 72
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
