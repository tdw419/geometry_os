; DESCRIPTION: Creates a magenta rectangular region at (439, 74) spanning 70 by 58 pixels.
; PLAN: r0=439(x), r1=74(y), r2=70(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 74
LDI r2, 70
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
