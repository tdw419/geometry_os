; DESCRIPTION: Creates a orange rectangular region at (129, 128) spanning 57 by 110 pixels.
; PLAN: r0=129(x), r1=128(y), r2=57(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 128
LDI r2, 57
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
