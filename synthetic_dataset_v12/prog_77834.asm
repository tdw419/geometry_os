; DESCRIPTION: Draws a red rectangle at (448, 53) with width 58 and height 17.
; PLAN: r0=448(x), r1=53(y), r2=58(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 53
LDI r2, 58
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
