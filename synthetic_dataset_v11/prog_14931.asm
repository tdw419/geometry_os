; DESCRIPTION: Creates a purple rectangular region at (71, 107) spanning 70 by 103 pixels.
; PLAN: r0=71(x), r1=107(y), r2=70(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 107
LDI r2, 70
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
