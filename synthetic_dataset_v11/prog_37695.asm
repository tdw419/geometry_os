; DESCRIPTION: Creates a orange rectangular region at (83, 179) spanning 24 by 59 pixels.
; PLAN: r0=83(x), r1=179(y), r2=24(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 179
LDI r2, 24
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
