; DESCRIPTION: Creates a orange rectangular region at (422, 109) spanning 48 by 18 pixels.
; PLAN: r0=422(x), r1=109(y), r2=48(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 109
LDI r2, 48
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
