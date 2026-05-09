; DESCRIPTION: Creates a red rectangular region at (141, 52) spanning 10 by 36 pixels.
; PLAN: r0=141(x), r1=52(y), r2=10(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 52
LDI r2, 10
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
