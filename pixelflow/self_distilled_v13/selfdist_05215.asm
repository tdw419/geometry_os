; DESCRIPTION: Draws a orange rectangle at (58, 71) with width 58 and height 64.
; PLAN: r0=58(x), r1=71(y), r2=58(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 71
LDI r2, 58
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
