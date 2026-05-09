; DESCRIPTION: Draws a red rectangle at (381, 112) with width 58 and height 47.
; PLAN: r0=381(x), r1=112(y), r2=58(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 112
LDI r2, 58
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
