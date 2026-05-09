; DESCRIPTION: Creates a red rectangular region at (172, 227) spanning 98 by 25 pixels.
; PLAN: r0=172(x), r1=227(y), r2=98(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 227
LDI r2, 98
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
