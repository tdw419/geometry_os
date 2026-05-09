; DESCRIPTION: Draws a green rectangle at (197, 131) with width 58 and height 110.
; PLAN: r0=197(x), r1=131(y), r2=58(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 131
LDI r2, 58
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
