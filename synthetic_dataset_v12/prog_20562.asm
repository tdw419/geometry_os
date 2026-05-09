; DESCRIPTION: Draws a white rectangle at (404, 110) with width 100 and height 117.
; PLAN: r0=404(x), r1=110(y), r2=100(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 110
LDI r2, 100
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
