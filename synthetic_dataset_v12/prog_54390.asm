; DESCRIPTION: Creates a purple rectangular region at (241, 147) spanning 39 by 26 pixels.
; PLAN: r0=241(x), r1=147(y), r2=39(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 147
LDI r2, 39
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
