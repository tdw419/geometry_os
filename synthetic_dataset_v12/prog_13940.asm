; DESCRIPTION: Creates a orange rectangular region at (137, 1) spanning 92 by 10 pixels.
; PLAN: r0=137(x), r1=1(y), r2=92(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 1
LDI r2, 92
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
