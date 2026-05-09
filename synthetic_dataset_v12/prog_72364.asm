; DESCRIPTION: Creates a purple rectangular region at (140, 152) spanning 117 by 22 pixels.
; PLAN: r0=140(x), r1=152(y), r2=117(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 152
LDI r2, 117
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
