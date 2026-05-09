; DESCRIPTION: Draws a red rectangle at (347, 98) with width 112 and height 24.
; PLAN: r0=347(x), r1=98(y), r2=112(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 98
LDI r2, 112
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
