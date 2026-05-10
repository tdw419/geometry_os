; DESCRIPTION: Creates a orange rectangular region at (214, 119) spanning 54 by 55 pixels.
; PLAN: r0=214(x), r1=119(y), r2=54(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 119
LDI r2, 54
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
