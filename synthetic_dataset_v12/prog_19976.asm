; DESCRIPTION: Draws a white rectangle at (404, 168) with width 97 and height 40.
; PLAN: r0=404(x), r1=168(y), r2=97(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 168
LDI r2, 97
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
