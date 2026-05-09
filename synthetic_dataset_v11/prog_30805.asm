; DESCRIPTION: Creates a magenta rectangular region at (123, 46) spanning 77 by 107 pixels.
; PLAN: r0=123(x), r1=46(y), r2=77(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 46
LDI r2, 77
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
