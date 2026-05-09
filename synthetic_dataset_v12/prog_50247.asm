; DESCRIPTION: Creates a red rectangular region at (273, 43) spanning 116 by 21 pixels.
; PLAN: r0=273(x), r1=43(y), r2=116(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 43
LDI r2, 116
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
