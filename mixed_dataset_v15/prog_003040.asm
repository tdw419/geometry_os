; DESCRIPTION: Creates a purple rectangular region at (92, 91) spanning 24 by 17 pixels.
; PLAN: r0=92(x), r1=91(y), r2=24(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 91
LDI r2, 24
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
