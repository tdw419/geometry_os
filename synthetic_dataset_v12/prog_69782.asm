; DESCRIPTION: Creates a magenta rectangular region at (301, 133) spanning 24 by 104 pixels.
; PLAN: r0=301(x), r1=133(y), r2=24(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 133
LDI r2, 24
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
