; DESCRIPTION: Creates a magenta rectangular region at (384, 156) spanning 59 by 55 pixels.
; PLAN: r0=384(x), r1=156(y), r2=59(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 156
LDI r2, 59
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
