; DESCRIPTION: Creates a red rectangular region at (230, 38) spanning 19 by 106 pixels.
; PLAN: r0=230(x), r1=38(y), r2=19(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 38
LDI r2, 19
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
