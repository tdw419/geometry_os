; DESCRIPTION: Creates a orange rectangular region at (218, 179) spanning 51 by 15 pixels.
; PLAN: r0=218(x), r1=179(y), r2=51(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 179
LDI r2, 51
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
