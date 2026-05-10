; DESCRIPTION: Creates a magenta rectangular region at (376, 31) spanning 108 by 59 pixels.
; PLAN: r0=376(x), r1=31(y), r2=108(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 31
LDI r2, 108
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
