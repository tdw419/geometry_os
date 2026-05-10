; DESCRIPTION: Creates a orange rectangular region at (273, 153) spanning 90 by 76 pixels.
; PLAN: r0=273(x), r1=153(y), r2=90(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 153
LDI r2, 90
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
