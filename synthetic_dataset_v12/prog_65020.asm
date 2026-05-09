; DESCRIPTION: Draws a green rectangle at (308, 125) with width 46 and height 18.
; PLAN: r0=308(x), r1=125(y), r2=46(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 125
LDI r2, 46
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
