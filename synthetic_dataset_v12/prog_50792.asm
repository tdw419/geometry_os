; DESCRIPTION: Draws a yellow rectangle at (346, 65) with width 12 and height 80.
; PLAN: r0=346(x), r1=65(y), r2=12(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 65
LDI r2, 12
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
