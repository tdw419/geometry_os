; DESCRIPTION: Creates a purple rectangular region at (71, 40) spanning 63 by 92 pixels.
; PLAN: r0=71(x), r1=40(y), r2=63(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 40
LDI r2, 63
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
