; DESCRIPTION: Draws a yellow rectangle at (164, 54) with width 60 and height 64.
; PLAN: r0=164(x), r1=54(y), r2=60(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 54
LDI r2, 60
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
