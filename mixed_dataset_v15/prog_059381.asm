; DESCRIPTION: Draws a red rectangle at (60, 191) with width 63 and height 36.
; PLAN: r0=60(x), r1=191(y), r2=63(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 191
LDI r2, 63
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
