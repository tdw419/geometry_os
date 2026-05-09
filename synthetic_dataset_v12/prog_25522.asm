; DESCRIPTION: Creates a purple rectangular region at (75, 133) spanning 24 by 107 pixels.
; PLAN: r0=75(x), r1=133(y), r2=24(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 133
LDI r2, 24
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
