; DESCRIPTION: Creates a magenta rectangular region at (87, 5) spanning 115 by 38 pixels.
; PLAN: r0=87(x), r1=5(y), r2=115(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 5
LDI r2, 115
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
