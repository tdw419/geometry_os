; DESCRIPTION: Draws a yellow rectangle at (178, 0) with width 64 and height 80.
; PLAN: r0=178(x), r1=0(y), r2=64(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 0
LDI r2, 64
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
