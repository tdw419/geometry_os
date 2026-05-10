; DESCRIPTION: Draws a blue rectangle at (308, 187) with width 83 and height 54.
; PLAN: r0=308(x), r1=187(y), r2=83(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 187
LDI r2, 83
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
