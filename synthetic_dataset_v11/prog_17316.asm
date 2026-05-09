; DESCRIPTION: Creates a red rectangular region at (71, 120) spanning 84 by 88 pixels.
; PLAN: r0=71(x), r1=120(y), r2=84(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 120
LDI r2, 84
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
