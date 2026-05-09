; DESCRIPTION: Creates a magenta rectangular region at (132, 33) spanning 12 by 54 pixels.
; PLAN: r0=132(x), r1=33(y), r2=12(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 33
LDI r2, 12
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
