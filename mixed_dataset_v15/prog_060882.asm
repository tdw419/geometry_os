; DESCRIPTION: Draws a red rectangle at (449, 160) with width 26 and height 90.
; PLAN: r0=449(x), r1=160(y), r2=26(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 160
LDI r2, 26
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
