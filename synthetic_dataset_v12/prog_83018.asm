; DESCRIPTION: Creates a purple rectangular region at (330, 89) spanning 60 by 46 pixels.
; PLAN: r0=330(x), r1=89(y), r2=60(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 89
LDI r2, 60
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
