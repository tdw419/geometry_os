; DESCRIPTION: Creates a purple rectangular region at (46, 134) spanning 20 by 102 pixels.
; PLAN: r0=46(x), r1=134(y), r2=20(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 134
LDI r2, 20
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
