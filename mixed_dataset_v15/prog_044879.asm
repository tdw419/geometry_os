; DESCRIPTION: Creates a orange filled rectangle of size 50x44 starting at (321, 58).
; PLAN: r0=321(x), r1=58(y), r2=50(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 58
LDI r2, 50
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
