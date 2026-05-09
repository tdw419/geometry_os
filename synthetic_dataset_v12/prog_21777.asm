; DESCRIPTION: Draws a green rectangle at (404, 184) with width 91 and height 37.
; PLAN: r0=404(x), r1=184(y), r2=91(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 184
LDI r2, 91
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
