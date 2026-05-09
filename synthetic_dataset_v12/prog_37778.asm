; DESCRIPTION: Creates a purple rectangular region at (352, 147) spanning 46 by 73 pixels.
; PLAN: r0=352(x), r1=147(y), r2=46(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 147
LDI r2, 46
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
