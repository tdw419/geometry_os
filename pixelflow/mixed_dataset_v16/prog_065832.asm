; DESCRIPTION: Creates a purple rectangular region at (373, 4) spanning 14 by 64 pixels.
; PLAN: r0=373(x), r1=4(y), r2=14(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 4
LDI r2, 14
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
