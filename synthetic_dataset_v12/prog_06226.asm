; DESCRIPTION: Creates a red rectangular region at (395, 189) spanning 85 by 62 pixels.
; PLAN: r0=395(x), r1=189(y), r2=85(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 189
LDI r2, 85
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
