; DESCRIPTION: Creates a orange rectangular region at (1, 9) spanning 50 by 34 pixels.
; PLAN: r0=1(x), r1=9(y), r2=50(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 9
LDI r2, 50
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
