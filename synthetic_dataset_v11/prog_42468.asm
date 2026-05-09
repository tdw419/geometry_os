; DESCRIPTION: Creates a orange rectangular region at (178, 94) spanning 64 by 115 pixels.
; PLAN: r0=178(x), r1=94(y), r2=64(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 94
LDI r2, 64
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
