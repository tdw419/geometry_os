; DESCRIPTION: Draws a yellow rectangle at (172, 57) with width 32 and height 57.
; PLAN: r0=172(x), r1=57(y), r2=32(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 57
LDI r2, 32
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
