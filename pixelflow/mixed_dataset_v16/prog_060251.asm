; DESCRIPTION: Creates a magenta rectangular region at (152, 167) spanning 96 by 87 pixels.
; PLAN: r0=152(x), r1=167(y), r2=96(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 167
LDI r2, 96
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
