; DESCRIPTION: Creates a orange rectangular region at (22, 115) spanning 85 by 109 pixels.
; PLAN: r0=22(x), r1=115(y), r2=85(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 115
LDI r2, 85
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
