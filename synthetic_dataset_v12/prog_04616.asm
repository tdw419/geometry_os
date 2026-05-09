; DESCRIPTION: Creates a purple rectangular region at (315, 182) spanning 24 by 28 pixels.
; PLAN: r0=315(x), r1=182(y), r2=24(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 182
LDI r2, 24
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
