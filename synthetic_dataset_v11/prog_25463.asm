; DESCRIPTION: Creates a purple rectangular region at (120, 147) spanning 120 by 106 pixels.
; PLAN: r0=120(x), r1=147(y), r2=120(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 147
LDI r2, 120
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
