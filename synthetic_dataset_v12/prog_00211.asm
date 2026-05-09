; DESCRIPTION: Creates a magenta rectangular region at (347, 80) spanning 106 by 104 pixels.
; PLAN: r0=347(x), r1=80(y), r2=106(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 80
LDI r2, 106
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
