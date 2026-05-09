; DESCRIPTION: Draws a green rectangle at (394, 115) with width 22 and height 12.
; PLAN: r0=394(x), r1=115(y), r2=22(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 115
LDI r2, 22
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
