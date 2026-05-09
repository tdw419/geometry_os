; DESCRIPTION: Creates a red rectangular region at (80, 31) spanning 60 by 87 pixels.
; PLAN: r0=80(x), r1=31(y), r2=60(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 31
LDI r2, 60
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
