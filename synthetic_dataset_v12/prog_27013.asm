; DESCRIPTION: Creates a purple rectangular region at (245, 3) spanning 46 by 107 pixels.
; PLAN: r0=245(x), r1=3(y), r2=46(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 3
LDI r2, 46
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
