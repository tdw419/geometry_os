; DESCRIPTION: Creates a magenta rectangular region at (150, 112) spanning 106 by 100 pixels.
; PLAN: r0=150(x), r1=112(y), r2=106(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 112
LDI r2, 106
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
