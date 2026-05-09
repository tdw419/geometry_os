; DESCRIPTION: Creates a orange rectangular region at (123, 45) spanning 66 by 40 pixels.
; PLAN: r0=123(x), r1=45(y), r2=66(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 45
LDI r2, 66
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
