; DESCRIPTION: Draws a red rectangle at (212, 145) with width 32 and height 109.
; PLAN: r0=212(x), r1=145(y), r2=32(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 145
LDI r2, 32
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
