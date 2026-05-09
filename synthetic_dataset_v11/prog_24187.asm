; DESCRIPTION: Draws a cyan rectangle at (148, 99) with width 11 and height 119.
; PLAN: r0=148(x), r1=99(y), r2=11(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 99
LDI r2, 11
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
