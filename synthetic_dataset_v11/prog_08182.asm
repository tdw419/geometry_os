; DESCRIPTION: Creates a magenta rectangular region at (110, 143) spanning 43 by 36 pixels.
; PLAN: r0=110(x), r1=143(y), r2=43(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 143
LDI r2, 43
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
