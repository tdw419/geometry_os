; DESCRIPTION: Creates a orange rectangular region at (190, 59) spanning 87 by 100 pixels.
; PLAN: r0=190(x), r1=59(y), r2=87(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 59
LDI r2, 87
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
