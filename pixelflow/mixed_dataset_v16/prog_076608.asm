; DESCRIPTION: Creates a magenta rectangular region at (283, 71) spanning 59 by 22 pixels.
; PLAN: r0=283(x), r1=71(y), r2=59(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 71
LDI r2, 59
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
