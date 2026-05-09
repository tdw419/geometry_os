; DESCRIPTION: Creates a orange rectangular region at (100, 36) spanning 36 by 54 pixels.
; PLAN: r0=100(x), r1=36(y), r2=36(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 36
LDI r2, 36
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
