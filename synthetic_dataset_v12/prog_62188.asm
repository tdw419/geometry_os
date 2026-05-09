; DESCRIPTION: Creates a red rectangular region at (159, 119) spanning 44 by 92 pixels.
; PLAN: r0=159(x), r1=119(y), r2=44(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 119
LDI r2, 44
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
