; DESCRIPTION: Creates a orange rectangular region at (44, 192) spanning 120 by 55 pixels.
; PLAN: r0=44(x), r1=192(y), r2=120(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 192
LDI r2, 120
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
