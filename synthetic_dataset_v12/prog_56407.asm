; DESCRIPTION: Creates a magenta rectangular region at (30, 147) spanning 100 by 46 pixels.
; PLAN: r0=30(x), r1=147(y), r2=100(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 147
LDI r2, 100
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
