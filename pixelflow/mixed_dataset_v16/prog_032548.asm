; DESCRIPTION: Creates a red rectangular region at (423, 126) spanning 52 by 38 pixels.
; PLAN: r0=423(x), r1=126(y), r2=52(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 126
LDI r2, 52
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
