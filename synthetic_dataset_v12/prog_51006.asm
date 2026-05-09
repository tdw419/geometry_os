; DESCRIPTION: Creates a magenta rectangular region at (392, 74) spanning 106 by 56 pixels.
; PLAN: r0=392(x), r1=74(y), r2=106(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 74
LDI r2, 106
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
