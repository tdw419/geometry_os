; DESCRIPTION: Draws a cyan rectangle at (120, 55) with width 106 and height 68.
; PLAN: r0=120(x), r1=55(y), r2=106(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 55
LDI r2, 106
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
