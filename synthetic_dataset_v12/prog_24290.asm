; DESCRIPTION: Creates a black rectangular region at (73, 80) spanning 87 by 55 pixels.
; PLAN: r0=73(x), r1=80(y), r2=87(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 80
LDI r2, 87
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
