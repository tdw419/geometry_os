; DESCRIPTION: Creates a orange rectangular region at (259, 30) spanning 85 by 70 pixels.
; PLAN: r0=259(x), r1=30(y), r2=85(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 30
LDI r2, 85
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
