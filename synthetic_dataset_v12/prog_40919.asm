; DESCRIPTION: Creates a orange rectangular region at (166, 152) spanning 54 by 10 pixels.
; PLAN: r0=166(x), r1=152(y), r2=54(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 152
LDI r2, 54
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
