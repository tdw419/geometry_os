; DESCRIPTION: Creates a magenta rectangular region at (116, 44) spanning 94 by 55 pixels.
; PLAN: r0=116(x), r1=44(y), r2=94(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 44
LDI r2, 94
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
