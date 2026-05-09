; DESCRIPTION: Creates a orange rectangular region at (107, 47) spanning 88 by 44 pixels.
; PLAN: r0=107(x), r1=47(y), r2=88(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 47
LDI r2, 88
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
