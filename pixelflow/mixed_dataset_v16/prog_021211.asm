; DESCRIPTION: Creates a magenta rectangular region at (169, 117) spanning 77 by 16 pixels.
; PLAN: r0=169(x), r1=117(y), r2=77(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 117
LDI r2, 77
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
