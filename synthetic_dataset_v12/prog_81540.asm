; DESCRIPTION: Creates a red rectangular region at (321, 109) spanning 83 by 95 pixels.
; PLAN: r0=321(x), r1=109(y), r2=83(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 109
LDI r2, 83
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
