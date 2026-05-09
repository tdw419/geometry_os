; DESCRIPTION: Creates a orange rectangular region at (54, 80) spanning 119 by 92 pixels.
; PLAN: r0=54(x), r1=80(y), r2=119(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 80
LDI r2, 119
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
