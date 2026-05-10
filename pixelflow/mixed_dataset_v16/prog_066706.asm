; DESCRIPTION: Creates a orange rectangular region at (260, 62) spanning 46 by 80 pixels.
; PLAN: r0=260(x), r1=62(y), r2=46(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 62
LDI r2, 46
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
