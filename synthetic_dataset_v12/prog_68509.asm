; DESCRIPTION: Creates a purple rectangular region at (295, 123) spanning 12 by 22 pixels.
; PLAN: r0=295(x), r1=123(y), r2=12(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 123
LDI r2, 12
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
