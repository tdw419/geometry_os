; DESCRIPTION: Creates a purple rectangular region at (229, 0) spanning 12 by 57 pixels.
; PLAN: r0=229(x), r1=0(y), r2=12(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 0
LDI r2, 12
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
