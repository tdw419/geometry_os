; DESCRIPTION: Draws a red rectangle at (308, 97) with width 66 and height 37.
; PLAN: r0=308(x), r1=97(y), r2=66(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 97
LDI r2, 66
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
