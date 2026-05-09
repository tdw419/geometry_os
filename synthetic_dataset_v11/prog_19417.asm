; DESCRIPTION: Creates a magenta rectangular region at (138, 58) spanning 10 by 87 pixels.
; PLAN: r0=138(x), r1=58(y), r2=10(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 58
LDI r2, 10
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
