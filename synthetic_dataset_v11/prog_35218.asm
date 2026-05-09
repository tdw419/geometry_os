; DESCRIPTION: Creates a yellow rectangular region at (189, 10) spanning 38 by 90 pixels.
; PLAN: r0=189(x), r1=10(y), r2=38(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 10
LDI r2, 38
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
