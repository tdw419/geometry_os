; DESCRIPTION: Draws a green rectangle at (17, 58) with width 79 and height 16.
; PLAN: r0=17(x), r1=58(y), r2=79(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 58
LDI r2, 79
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
