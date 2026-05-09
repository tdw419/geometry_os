; DESCRIPTION: Draws a green rectangle at (254, 46) with width 79 and height 61.
; PLAN: r0=254(x), r1=46(y), r2=79(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 46
LDI r2, 79
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
