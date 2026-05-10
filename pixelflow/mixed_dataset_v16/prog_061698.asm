; DESCRIPTION: Draws a blue rectangle at (368, 80) with width 85 and height 108.
; PLAN: r0=368(x), r1=80(y), r2=85(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 80
LDI r2, 85
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
