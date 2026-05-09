; DESCRIPTION: Creates a orange rectangular region at (201, 161) spanning 16 by 10 pixels.
; PLAN: r0=201(x), r1=161(y), r2=16(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 161
LDI r2, 16
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
