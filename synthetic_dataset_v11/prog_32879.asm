; DESCRIPTION: Creates a purple rectangular region at (117, 32) spanning 115 by 57 pixels.
; PLAN: r0=117(x), r1=32(y), r2=115(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 32
LDI r2, 115
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
