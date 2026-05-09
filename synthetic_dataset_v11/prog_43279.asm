; DESCRIPTION: Creates a purple rectangular region at (189, 5) spanning 57 by 12 pixels.
; PLAN: r0=189(x), r1=5(y), r2=57(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 5
LDI r2, 57
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
