; DESCRIPTION: Draws a yellow rectangle at (387, 200) with width 106 and height 83.
; PLAN: r0=387(x), r1=200(y), r2=106(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 200
LDI r2, 106
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
