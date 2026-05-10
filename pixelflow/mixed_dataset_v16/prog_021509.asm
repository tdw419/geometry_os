; DESCRIPTION: Creates a magenta rectangular region at (347, 44) spanning 37 by 99 pixels.
; PLAN: r0=347(x), r1=44(y), r2=37(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 44
LDI r2, 37
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
