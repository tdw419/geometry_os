; DESCRIPTION: Creates a orange rectangular region at (356, 23) spanning 44 by 33 pixels.
; PLAN: r0=356(x), r1=23(y), r2=44(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 23
LDI r2, 44
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
