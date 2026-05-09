; DESCRIPTION: Creates a magenta rectangular region at (152, 175) spanning 80 by 81 pixels.
; PLAN: r0=152(x), r1=175(y), r2=80(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 175
LDI r2, 80
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
