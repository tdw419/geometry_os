; DESCRIPTION: Creates a orange rectangular region at (35, 95) spanning 64 by 63 pixels.
; PLAN: r0=35(x), r1=95(y), r2=64(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 95
LDI r2, 64
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
