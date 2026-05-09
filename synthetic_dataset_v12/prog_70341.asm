; DESCRIPTION: Creates a magenta rectangular region at (141, 50) spanning 83 by 63 pixels.
; PLAN: r0=141(x), r1=50(y), r2=83(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 50
LDI r2, 83
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
