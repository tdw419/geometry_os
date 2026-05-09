; DESCRIPTION: Creates a magenta rectangular region at (77, 5) spanning 91 by 102 pixels.
; PLAN: r0=77(x), r1=5(y), r2=91(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 5
LDI r2, 91
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
