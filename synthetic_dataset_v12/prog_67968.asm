; DESCRIPTION: Creates a orange rectangular region at (46, 184) spanning 83 by 61 pixels.
; PLAN: r0=46(x), r1=184(y), r2=83(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 184
LDI r2, 83
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
