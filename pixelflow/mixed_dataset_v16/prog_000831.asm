; DESCRIPTION: Creates a purple rectangular region at (149, 107) spanning 68 by 109 pixels.
; PLAN: r0=149(x), r1=107(y), r2=68(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 107
LDI r2, 68
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
