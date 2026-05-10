; DESCRIPTION: Draws a magenta rectangle at (298, 218) with width 36 and height 22.
; PLAN: r0=298(x), r1=218(y), r2=36(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 218
LDI r2, 36
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
