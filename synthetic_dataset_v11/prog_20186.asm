; DESCRIPTION: Creates a orange rectangular region at (152, 89) spanning 82 by 13 pixels.
; PLAN: r0=152(x), r1=89(y), r2=82(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 89
LDI r2, 82
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
