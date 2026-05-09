; DESCRIPTION: Creates a red rectangular region at (20, 185) spanning 28 by 38 pixels.
; PLAN: r0=20(x), r1=185(y), r2=28(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 185
LDI r2, 28
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
