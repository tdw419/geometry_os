; DESCRIPTION: Draws a green rectangle at (90, 112) with width 79 and height 93.
; PLAN: r0=90(x), r1=112(y), r2=79(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 112
LDI r2, 79
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
