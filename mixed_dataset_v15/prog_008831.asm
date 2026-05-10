; DESCRIPTION: Draws a green rectangle at (413, 4) with width 60 and height 91.
; PLAN: r0=413(x), r1=4(y), r2=60(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 4
LDI r2, 60
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
