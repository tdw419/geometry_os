; DESCRIPTION: Creates a orange rectangular region at (83, 12) spanning 70 by 80 pixels.
; PLAN: r0=83(x), r1=12(y), r2=70(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 12
LDI r2, 70
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
