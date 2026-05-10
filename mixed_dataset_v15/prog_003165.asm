; DESCRIPTION: Creates a orange rectangular region at (325, 50) spanning 77 by 60 pixels.
; PLAN: r0=325(x), r1=50(y), r2=77(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 50
LDI r2, 77
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
