; DESCRIPTION: Places a orange 76x110 rectangle at position (116, 77).
; PLAN: r0=116(x), r1=77(y), r2=76(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 77
LDI r2, 76
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
