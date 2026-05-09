; DESCRIPTION: Creates a red rectangular region at (153, 11) spanning 112 by 66 pixels.
; PLAN: r0=153(x), r1=11(y), r2=112(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 11
LDI r2, 112
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
