; DESCRIPTION: Creates a purple rectangular region at (248, 59) spanning 100 by 70 pixels.
; PLAN: r0=248(x), r1=59(y), r2=100(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 59
LDI r2, 100
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
