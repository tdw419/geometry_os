; DESCRIPTION: Creates a magenta rectangular region at (247, 46) spanning 46 by 46 pixels.
; PLAN: r0=247(x), r1=46(y), r2=46(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 46
LDI r2, 46
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
