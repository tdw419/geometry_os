; DESCRIPTION: Creates a red rectangular region at (331, 26) spanning 32 by 110 pixels.
; PLAN: r0=331(x), r1=26(y), r2=32(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 26
LDI r2, 32
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
