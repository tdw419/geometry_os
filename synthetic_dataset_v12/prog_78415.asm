; DESCRIPTION: Creates a orange rectangular region at (331, 45) spanning 40 by 27 pixels.
; PLAN: r0=331(x), r1=45(y), r2=40(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 45
LDI r2, 40
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
