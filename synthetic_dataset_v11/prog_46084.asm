; DESCRIPTION: Creates a magenta rectangular region at (147, 79) spanning 105 by 94 pixels.
; PLAN: r0=147(x), r1=79(y), r2=105(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 79
LDI r2, 105
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
