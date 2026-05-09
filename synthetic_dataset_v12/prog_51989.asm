; DESCRIPTION: Creates a black rectangular region at (288, 182) spanning 92 by 26 pixels.
; PLAN: r0=288(x), r1=182(y), r2=92(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 182
LDI r2, 92
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
