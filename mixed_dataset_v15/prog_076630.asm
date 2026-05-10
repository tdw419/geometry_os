; DESCRIPTION: Creates a magenta rectangular region at (152, 126) spanning 96 by 112 pixels.
; PLAN: r0=152(x), r1=126(y), r2=96(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 126
LDI r2, 96
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
