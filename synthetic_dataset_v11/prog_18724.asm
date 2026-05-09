; DESCRIPTION: Creates a orange rectangular region at (152, 20) spanning 30 by 29 pixels.
; PLAN: r0=152(x), r1=20(y), r2=30(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 20
LDI r2, 30
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
