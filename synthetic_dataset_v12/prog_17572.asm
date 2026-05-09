; DESCRIPTION: Places a orange 83x47 rectangle at position (194, 22).
; PLAN: r0=194(x), r1=22(y), r2=83(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 22
LDI r2, 83
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
