; DESCRIPTION: Draws a red rectangle at (230, 58) with width 31 and height 19.
; PLAN: r0=230(x), r1=58(y), r2=31(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 58
LDI r2, 31
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
