; DESCRIPTION: Draws a green rectangle at (404, 128) with width 89 and height 48.
; PLAN: r0=404(x), r1=128(y), r2=89(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 128
LDI r2, 89
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
