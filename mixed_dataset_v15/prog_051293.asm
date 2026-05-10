; DESCRIPTION: Creates a purple rectangular region at (57, 115) spanning 48 by 48 pixels.
; PLAN: r0=57(x), r1=115(y), r2=48(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 115
LDI r2, 48
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
