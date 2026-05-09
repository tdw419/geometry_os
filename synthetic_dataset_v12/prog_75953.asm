; DESCRIPTION: Creates a orange rectangular region at (458, 208) spanning 46 by 48 pixels.
; PLAN: r0=458(x), r1=208(y), r2=46(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 208
LDI r2, 46
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
