; DESCRIPTION: Creates a purple rectangular region at (152, 124) spanning 72 by 14 pixels.
; PLAN: r0=152(x), r1=124(y), r2=72(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 124
LDI r2, 72
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
