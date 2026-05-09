; DESCRIPTION: Creates a orange rectangular region at (190, 1) spanning 103 by 80 pixels.
; PLAN: r0=190(x), r1=1(y), r2=103(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 1
LDI r2, 103
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
