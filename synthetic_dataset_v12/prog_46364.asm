; DESCRIPTION: Creates a orange rectangular region at (179, 33) spanning 81 by 31 pixels.
; PLAN: r0=179(x), r1=33(y), r2=81(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 33
LDI r2, 81
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
