; DESCRIPTION: Draws a green rectangle at (411, 187) with width 37 and height 51.
; PLAN: r0=411(x), r1=187(y), r2=37(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 187
LDI r2, 37
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
