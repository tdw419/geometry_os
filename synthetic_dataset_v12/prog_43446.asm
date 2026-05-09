; DESCRIPTION: Creates a magenta rectangular region at (388, 101) spanning 83 by 104 pixels.
; PLAN: r0=388(x), r1=101(y), r2=83(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 101
LDI r2, 83
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
