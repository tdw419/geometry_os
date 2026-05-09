; DESCRIPTION: Draws a magenta rectangle at (218, 46) with width 26 and height 104.
; PLAN: r0=218(x), r1=46(y), r2=26(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 46
LDI r2, 26
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
