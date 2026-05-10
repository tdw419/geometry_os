; DESCRIPTION: Draws a green rectangle at (368, 40) with width 90 and height 79.
; PLAN: r0=368(x), r1=40(y), r2=90(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 40
LDI r2, 90
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
