; DESCRIPTION: Creates a orange rectangular region at (411, 26) spanning 85 by 10 pixels.
; PLAN: r0=411(x), r1=26(y), r2=85(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 26
LDI r2, 85
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
