; DESCRIPTION: Creates a magenta rectangular region at (415, 145) spanning 94 by 58 pixels.
; PLAN: r0=415(x), r1=145(y), r2=94(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 145
LDI r2, 94
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
