; DESCRIPTION: Creates a red rectangular region at (287, 94) spanning 44 by 78 pixels.
; PLAN: r0=287(x), r1=94(y), r2=44(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 94
LDI r2, 44
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
