; DESCRIPTION: Creates a magenta rectangular region at (288, 156) spanning 70 by 71 pixels.
; PLAN: r0=288(x), r1=156(y), r2=70(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 156
LDI r2, 70
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
