; DESCRIPTION: Creates a orange rectangular region at (70, 77) spanning 102 by 109 pixels.
; PLAN: r0=70(x), r1=77(y), r2=102(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 77
LDI r2, 102
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
