; DESCRIPTION: Creates a orange rectangular region at (223, 112) spanning 29 by 70 pixels.
; PLAN: r0=223(x), r1=112(y), r2=29(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 112
LDI r2, 29
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
