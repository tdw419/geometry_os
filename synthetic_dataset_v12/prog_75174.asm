; DESCRIPTION: Draws a red rectangle at (311, 10) with width 64 and height 55.
; PLAN: r0=311(x), r1=10(y), r2=64(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 10
LDI r2, 64
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
