; DESCRIPTION: Creates a orange rectangular region at (3, 214) spanning 102 by 13 pixels.
; PLAN: r0=3(x), r1=214(y), r2=102(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 214
LDI r2, 102
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
