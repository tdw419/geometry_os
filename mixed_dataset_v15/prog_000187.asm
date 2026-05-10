; DESCRIPTION: Creates a orange rectangular region at (149, 8) spanning 48 by 87 pixels.
; PLAN: r0=149(x), r1=8(y), r2=48(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 8
LDI r2, 48
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
