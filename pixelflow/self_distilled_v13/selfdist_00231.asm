; DESCRIPTION: Creates a magenta filled rectangle of size 77x87 starting at (133, 169).
; PLAN: r0=133(x), r1=169(y), r2=77(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 169
LDI r2, 77
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
