; DESCRIPTION: Draws a orange rectangle at (186, 38) with width 111 and height 89.
; PLAN: r0=186(x), r1=38(y), r2=111(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 38
LDI r2, 111
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
