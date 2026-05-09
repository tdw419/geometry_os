; DESCRIPTION: Creates a red rectangular region at (9, 137) spanning 83 by 80 pixels.
; PLAN: r0=9(x), r1=137(y), r2=83(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 137
LDI r2, 83
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
