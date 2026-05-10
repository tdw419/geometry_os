; DESCRIPTION: Draws a orange rectangle at (147, 104) with width 42 and height 71.
; PLAN: r0=147(x), r1=104(y), r2=42(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 104
LDI r2, 42
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
