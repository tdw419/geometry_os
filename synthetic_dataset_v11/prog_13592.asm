; DESCRIPTION: Draws a magenta rectangle at (218, 47) with width 17 and height 31.
; PLAN: r0=218(x), r1=47(y), r2=17(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 47
LDI r2, 17
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
