; DESCRIPTION: Draws a blue rectangle at (271, 182) with width 77 and height 54.
; PLAN: r0=271(x), r1=182(y), r2=77(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 182
LDI r2, 77
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
