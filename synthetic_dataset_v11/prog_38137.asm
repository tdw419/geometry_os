; DESCRIPTION: Creates a orange rectangular region at (177, 1) spanning 25 by 80 pixels.
; PLAN: r0=177(x), r1=1(y), r2=25(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 1
LDI r2, 25
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
