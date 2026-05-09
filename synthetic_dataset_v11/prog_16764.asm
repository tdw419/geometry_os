; DESCRIPTION: Draws a cyan rectangle at (23, 68) with width 115 and height 96.
; PLAN: r0=23(x), r1=68(y), r2=115(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 68
LDI r2, 115
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
