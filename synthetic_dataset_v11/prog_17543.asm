; DESCRIPTION: Creates a orange rectangular region at (90, 31) spanning 95 by 52 pixels.
; PLAN: r0=90(x), r1=31(y), r2=95(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 31
LDI r2, 95
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
