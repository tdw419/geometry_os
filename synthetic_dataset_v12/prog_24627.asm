; DESCRIPTION: Creates a magenta rectangular region at (248, 101) spanning 112 by 77 pixels.
; PLAN: r0=248(x), r1=101(y), r2=112(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 101
LDI r2, 112
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
