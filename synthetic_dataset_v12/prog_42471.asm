; DESCRIPTION: Draws a yellow rectangle at (72, 32) with width 33 and height 24.
; PLAN: r0=72(x), r1=32(y), r2=33(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 32
LDI r2, 33
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
