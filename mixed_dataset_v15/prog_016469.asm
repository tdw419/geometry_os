; DESCRIPTION: Creates a orange rectangular region at (85, 131) spanning 106 by 48 pixels.
; PLAN: r0=85(x), r1=131(y), r2=106(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 131
LDI r2, 106
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
