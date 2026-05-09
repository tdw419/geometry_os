; DESCRIPTION: Creates a purple rectangular region at (332, 152) spanning 61 by 70 pixels.
; PLAN: r0=332(x), r1=152(y), r2=61(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 152
LDI r2, 61
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
