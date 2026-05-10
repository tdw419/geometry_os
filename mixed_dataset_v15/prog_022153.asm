; DESCRIPTION: Creates a orange rectangular region at (402, 47) spanning 46 by 81 pixels.
; PLAN: r0=402(x), r1=47(y), r2=46(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 47
LDI r2, 46
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
