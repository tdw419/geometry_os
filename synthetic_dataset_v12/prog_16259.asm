; DESCRIPTION: Creates a purple rectangular region at (273, 140) spanning 65 by 107 pixels.
; PLAN: r0=273(x), r1=140(y), r2=65(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 140
LDI r2, 65
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
