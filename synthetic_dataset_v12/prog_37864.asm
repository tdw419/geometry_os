; DESCRIPTION: Draws a cyan rectangle at (380, 181) with width 119 and height 46.
; PLAN: r0=380(x), r1=181(y), r2=119(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 181
LDI r2, 119
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
