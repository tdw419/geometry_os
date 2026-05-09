; DESCRIPTION: Draws a cyan rectangle at (152, 44) with width 52 and height 119.
; PLAN: r0=152(x), r1=44(y), r2=52(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 44
LDI r2, 52
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
