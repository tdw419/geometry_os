; DESCRIPTION: Draws a orange rectangle at (258, 42) with width 87 and height 94.
; PLAN: r0=258(x), r1=42(y), r2=87(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 42
LDI r2, 87
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
