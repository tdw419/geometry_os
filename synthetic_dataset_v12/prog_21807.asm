; DESCRIPTION: Creates a orange rectangular region at (477, 31) spanning 16 by 89 pixels.
; PLAN: r0=477(x), r1=31(y), r2=16(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 31
LDI r2, 16
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
