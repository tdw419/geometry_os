; DESCRIPTION: Draws a black rectangle at (218, 176) with width 46 and height 65.
; PLAN: r0=218(x), r1=176(y), r2=46(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 176
LDI r2, 46
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
