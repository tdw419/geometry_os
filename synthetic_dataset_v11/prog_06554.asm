; DESCRIPTION: Draws a cyan rectangle at (152, 26) with width 83 and height 70.
; PLAN: r0=152(x), r1=26(y), r2=83(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 26
LDI r2, 83
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
