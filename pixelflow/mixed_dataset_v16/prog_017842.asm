; DESCRIPTION: Creates a red rectangular region at (458, 13) spanning 15 by 40 pixels.
; PLAN: r0=458(x), r1=13(y), r2=15(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 13
LDI r2, 15
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
