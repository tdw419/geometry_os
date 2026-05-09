; DESCRIPTION: Creates a red rectangular region at (321, 191) spanning 25 by 12 pixels.
; PLAN: r0=321(x), r1=191(y), r2=25(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 191
LDI r2, 25
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
