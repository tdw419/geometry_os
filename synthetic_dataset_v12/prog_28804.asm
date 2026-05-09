; DESCRIPTION: Draws a white rectangle at (292, 106) with width 48 and height 44.
; PLAN: r0=292(x), r1=106(y), r2=48(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 106
LDI r2, 48
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
