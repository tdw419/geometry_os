; DESCRIPTION: Creates a orange rectangular region at (361, 191) spanning 37 by 16 pixels.
; PLAN: r0=361(x), r1=191(y), r2=37(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 191
LDI r2, 37
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
