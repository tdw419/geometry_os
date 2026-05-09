; DESCRIPTION: Creates a purple rectangular region at (46, 148) spanning 49 by 86 pixels.
; PLAN: r0=46(x), r1=148(y), r2=49(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 148
LDI r2, 49
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
