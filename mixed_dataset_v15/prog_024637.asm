; DESCRIPTION: Creates a magenta rectangular region at (260, 4) spanning 62 by 54 pixels.
; PLAN: r0=260(x), r1=4(y), r2=62(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 4
LDI r2, 62
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
