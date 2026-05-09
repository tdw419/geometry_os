; DESCRIPTION: Creates a red rectangular region at (71, 18) spanning 52 by 24 pixels.
; PLAN: r0=71(x), r1=18(y), r2=52(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 18
LDI r2, 52
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
