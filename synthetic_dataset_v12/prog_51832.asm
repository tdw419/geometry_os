; DESCRIPTION: Creates a red rectangular region at (245, 49) spanning 11 by 21 pixels.
; PLAN: r0=245(x), r1=49(y), r2=11(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 49
LDI r2, 11
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
