; DESCRIPTION: Creates a orange rectangular region at (68, 10) spanning 89 by 21 pixels.
; PLAN: r0=68(x), r1=10(y), r2=89(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 10
LDI r2, 89
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
