; DESCRIPTION: Draws a red rectangle at (110, 99) with width 42 and height 23.
; PLAN: r0=110(x), r1=99(y), r2=42(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 99
LDI r2, 42
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
