; DESCRIPTION: Creates a orange rectangular region at (80, 52) spanning 12 by 50 pixels.
; PLAN: r0=80(x), r1=52(y), r2=12(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 52
LDI r2, 12
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
