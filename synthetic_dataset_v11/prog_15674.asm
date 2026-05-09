; DESCRIPTION: Creates a orange rectangular region at (87, 4) spanning 50 by 22 pixels.
; PLAN: r0=87(x), r1=4(y), r2=50(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 4
LDI r2, 50
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
