; DESCRIPTION: Creates a orange rectangular region at (180, 211) spanning 55 by 22 pixels.
; PLAN: r0=180(x), r1=211(y), r2=55(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 211
LDI r2, 55
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
