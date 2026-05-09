; DESCRIPTION: Creates a magenta rectangular region at (72, 147) spanning 54 by 58 pixels.
; PLAN: r0=72(x), r1=147(y), r2=54(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 147
LDI r2, 54
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
