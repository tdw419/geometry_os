; DESCRIPTION: Creates a magenta rectangular region at (320, 90) spanning 31 by 87 pixels.
; PLAN: r0=320(x), r1=90(y), r2=31(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 90
LDI r2, 31
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
