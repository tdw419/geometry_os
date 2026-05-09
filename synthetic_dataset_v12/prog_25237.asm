; DESCRIPTION: Creates a orange rectangular region at (107, 95) spanning 31 by 105 pixels.
; PLAN: r0=107(x), r1=95(y), r2=31(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 95
LDI r2, 31
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
