; DESCRIPTION: Creates a red rectangular region at (407, 109) spanning 102 by 48 pixels.
; PLAN: r0=407(x), r1=109(y), r2=102(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 109
LDI r2, 102
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
