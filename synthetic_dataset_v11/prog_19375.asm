; DESCRIPTION: Creates a orange rectangular region at (7, 201) spanning 94 by 27 pixels.
; PLAN: r0=7(x), r1=201(y), r2=94(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 201
LDI r2, 94
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
