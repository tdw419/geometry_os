; DESCRIPTION: Creates a purple rectangular region at (25, 37) spanning 92 by 85 pixels.
; PLAN: r0=25(x), r1=37(y), r2=92(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 37
LDI r2, 92
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
