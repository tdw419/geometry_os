; DESCRIPTION: Creates a magenta rectangular region at (104, 112) spanning 10 by 106 pixels.
; PLAN: r0=104(x), r1=112(y), r2=10(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 112
LDI r2, 10
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
