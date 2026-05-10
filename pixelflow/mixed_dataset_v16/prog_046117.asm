; DESCRIPTION: Creates a purple rectangular region at (193, 57) spanning 80 by 96 pixels.
; PLAN: r0=193(x), r1=57(y), r2=80(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 57
LDI r2, 80
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
