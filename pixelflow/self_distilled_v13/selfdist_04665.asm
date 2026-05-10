; DESCRIPTION: Draws a green rectangle at (300, 11) with width 61 and height 109.
; PLAN: r0=300(x), r1=11(y), r2=61(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 11
LDI r2, 61
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
