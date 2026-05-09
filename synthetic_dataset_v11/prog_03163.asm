; DESCRIPTION: Creates a magenta rectangular region at (138, 3) spanning 86 by 116 pixels.
; PLAN: r0=138(x), r1=3(y), r2=86(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 3
LDI r2, 86
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
