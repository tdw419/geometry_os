; DESCRIPTION: Draws a red rectangle at (489, 37) with width 19 and height 95.
; PLAN: r0=489(x), r1=37(y), r2=19(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 37
LDI r2, 19
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
