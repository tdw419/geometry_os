; DESCRIPTION: Creates a orange rectangular region at (72, 137) spanning 82 by 45 pixels.
; PLAN: r0=72(x), r1=137(y), r2=82(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 137
LDI r2, 82
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
