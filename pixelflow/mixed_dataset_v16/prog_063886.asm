; DESCRIPTION: Draws a green rectangle at (278, 226) with width 98 and height 21.
; PLAN: r0=278(x), r1=226(y), r2=98(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 226
LDI r2, 98
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
