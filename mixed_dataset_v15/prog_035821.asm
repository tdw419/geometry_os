; DESCRIPTION: Draws a green rectangle at (272, 125) with width 58 and height 117.
; PLAN: r0=272(x), r1=125(y), r2=58(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 125
LDI r2, 58
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
