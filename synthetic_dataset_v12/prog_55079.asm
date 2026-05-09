; DESCRIPTION: Draws a red rectangle at (258, 7) with width 21 and height 89.
; PLAN: r0=258(x), r1=7(y), r2=21(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 7
LDI r2, 21
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
