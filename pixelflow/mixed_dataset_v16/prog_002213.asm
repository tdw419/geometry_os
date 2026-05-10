; DESCRIPTION: Creates a purple rectangular region at (331, 120) spanning 99 by 61 pixels.
; PLAN: r0=331(x), r1=120(y), r2=99(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 120
LDI r2, 99
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
