; DESCRIPTION: Creates a black rectangular region at (276, 45) spanning 58 by 54 pixels.
; PLAN: r0=276(x), r1=45(y), r2=58(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 45
LDI r2, 58
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
