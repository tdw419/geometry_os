; DESCRIPTION: Creates a magenta rectangular region at (121, 147) spanning 111 by 63 pixels.
; PLAN: r0=121(x), r1=147(y), r2=111(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 147
LDI r2, 111
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
