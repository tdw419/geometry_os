; DESCRIPTION: Creates a magenta rectangular region at (141, 229) spanning 105 by 10 pixels.
; PLAN: r0=141(x), r1=229(y), r2=105(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 229
LDI r2, 105
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
