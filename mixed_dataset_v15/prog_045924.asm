; DESCRIPTION: Creates a red rectangular region at (18, 6) spanning 105 by 66 pixels.
; PLAN: r0=18(x), r1=6(y), r2=105(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 6
LDI r2, 105
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
