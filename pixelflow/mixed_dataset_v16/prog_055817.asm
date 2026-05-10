; DESCRIPTION: Draws a red rectangle at (244, 99) with width 46 and height 30.
; PLAN: r0=244(x), r1=99(y), r2=46(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 99
LDI r2, 46
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
