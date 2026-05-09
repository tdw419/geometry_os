; DESCRIPTION: Creates a orange rectangular region at (161, 16) spanning 85 by 64 pixels.
; PLAN: r0=161(x), r1=16(y), r2=85(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 16
LDI r2, 85
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
