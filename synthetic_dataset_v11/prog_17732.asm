; DESCRIPTION: Creates a purple rectangular region at (152, 32) spanning 33 by 78 pixels.
; PLAN: r0=152(x), r1=32(y), r2=33(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 32
LDI r2, 33
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
