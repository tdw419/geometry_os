; DESCRIPTION: Draws a green rectangle at (376, 58) with width 16 and height 35.
; PLAN: r0=376(x), r1=58(y), r2=16(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 58
LDI r2, 16
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
