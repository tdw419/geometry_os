; DESCRIPTION: Creates a red rectangular region at (98, 6) spanning 52 by 100 pixels.
; PLAN: r0=98(x), r1=6(y), r2=52(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 6
LDI r2, 52
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
