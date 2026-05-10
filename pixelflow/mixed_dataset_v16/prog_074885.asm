; DESCRIPTION: Creates a magenta rectangular region at (247, 22) spanning 91 by 76 pixels.
; PLAN: r0=247(x), r1=22(y), r2=91(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 22
LDI r2, 91
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
