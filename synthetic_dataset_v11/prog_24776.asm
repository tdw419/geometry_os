; DESCRIPTION: Draws a magenta rectangle at (4, 32) with width 104 and height 46.
; PLAN: r0=4(x), r1=32(y), r2=104(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 32
LDI r2, 104
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
