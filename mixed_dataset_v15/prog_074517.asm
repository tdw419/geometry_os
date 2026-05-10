; DESCRIPTION: Creates a magenta rectangular region at (280, 22) spanning 76 by 59 pixels.
; PLAN: r0=280(x), r1=22(y), r2=76(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 22
LDI r2, 76
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
