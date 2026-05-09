; DESCRIPTION: Creates a black rectangular region at (54, 182) spanning 23 by 13 pixels.
; PLAN: r0=54(x), r1=182(y), r2=23(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 182
LDI r2, 23
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
