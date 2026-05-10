; DESCRIPTION: Creates a magenta rectangular region at (58, 46) spanning 64 by 70 pixels.
; PLAN: r0=58(x), r1=46(y), r2=64(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 46
LDI r2, 64
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
