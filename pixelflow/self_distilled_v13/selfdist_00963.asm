; DESCRIPTION: Draws a red rectangle at (374, 162) with width 115 and height 55.
; PLAN: r0=374(x), r1=162(y), r2=115(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 162
LDI r2, 115
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
