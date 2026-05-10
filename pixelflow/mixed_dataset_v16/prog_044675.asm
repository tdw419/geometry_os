; DESCRIPTION: Draws a red rectangle at (251, 62) with width 63 and height 58.
; PLAN: r0=251(x), r1=62(y), r2=63(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 62
LDI r2, 63
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
