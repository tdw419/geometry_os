; DESCRIPTION: Creates a orange rectangular region at (422, 13) spanning 70 by 55 pixels.
; PLAN: r0=422(x), r1=13(y), r2=70(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 13
LDI r2, 70
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
