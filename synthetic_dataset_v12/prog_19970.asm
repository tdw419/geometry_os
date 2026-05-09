; DESCRIPTION: Creates a blue rectangular region at (240, 182) spanning 22 by 72 pixels.
; PLAN: r0=240(x), r1=182(y), r2=22(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 182
LDI r2, 22
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
