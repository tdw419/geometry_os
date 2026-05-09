; DESCRIPTION: Draws a green rectangle at (80, 87) with width 10 and height 59.
; PLAN: r0=80(x), r1=87(y), r2=10(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 87
LDI r2, 10
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
