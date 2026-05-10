; DESCRIPTION: Creates a orange rectangular region at (244, 51) spanning 68 by 45 pixels.
; PLAN: r0=244(x), r1=51(y), r2=68(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 51
LDI r2, 68
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
