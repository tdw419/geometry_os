; DESCRIPTION: Creates a orange rectangular region at (227, 146) spanning 10 by 73 pixels.
; PLAN: r0=227(x), r1=146(y), r2=10(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 146
LDI r2, 10
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
