; DESCRIPTION: Draws a orange rectangle at (98, 147) with width 59 and height 52.
; PLAN: r0=98(x), r1=147(y), r2=59(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 147
LDI r2, 59
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
