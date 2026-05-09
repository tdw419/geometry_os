; DESCRIPTION: Draws a red rectangle at (258, 2) with width 65 and height 112.
; PLAN: r0=258(x), r1=2(y), r2=65(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 2
LDI r2, 65
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
