; DESCRIPTION: Draws a cyan rectangle at (119, 22) with width 29 and height 42.
; PLAN: r0=119(x), r1=22(y), r2=29(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 22
LDI r2, 29
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
