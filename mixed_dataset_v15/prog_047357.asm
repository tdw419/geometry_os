; DESCRIPTION: Draws a green rectangle at (412, 72) with width 23 and height 80.
; PLAN: r0=412(x), r1=72(y), r2=23(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 72
LDI r2, 23
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
