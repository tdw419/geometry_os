; DESCRIPTION: Creates a orange rectangular region at (152, 90) spanning 23 by 18 pixels.
; PLAN: r0=152(x), r1=90(y), r2=23(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 90
LDI r2, 23
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
