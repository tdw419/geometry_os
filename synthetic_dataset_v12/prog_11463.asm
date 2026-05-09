; DESCRIPTION: Creates a orange rectangular region at (103, 71) spanning 100 by 60 pixels.
; PLAN: r0=103(x), r1=71(y), r2=100(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 71
LDI r2, 100
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
