; DESCRIPTION: Draws a green rectangle at (396, 39) with width 33 and height 95.
; PLAN: r0=396(x), r1=39(y), r2=33(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 39
LDI r2, 33
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
