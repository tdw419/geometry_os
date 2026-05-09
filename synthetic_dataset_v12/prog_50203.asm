; DESCRIPTION: Creates a black rectangular region at (236, 33) spanning 54 by 115 pixels.
; PLAN: r0=236(x), r1=33(y), r2=54(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 33
LDI r2, 54
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
