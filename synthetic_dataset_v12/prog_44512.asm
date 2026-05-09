; DESCRIPTION: Draws a black rectangle at (273, 46) with width 23 and height 70.
; PLAN: r0=273(x), r1=46(y), r2=23(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 46
LDI r2, 23
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
