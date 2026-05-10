; DESCRIPTION: Creates a yellow rectangular region at (85, 5) spanning 64 by 87 pixels.
; PLAN: r0=85(x), r1=5(y), r2=64(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 5
LDI r2, 64
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
