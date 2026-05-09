; DESCRIPTION: Creates a black rectangular region at (343, 146) spanning 22 by 96 pixels.
; PLAN: r0=343(x), r1=146(y), r2=22(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 146
LDI r2, 22
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
