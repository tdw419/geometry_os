; DESCRIPTION: Creates a orange rectangular region at (109, 85) spanning 20 by 107 pixels.
; PLAN: r0=109(x), r1=85(y), r2=20(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 85
LDI r2, 20
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
