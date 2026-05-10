; DESCRIPTION: Creates a purple rectangular region at (264, 12) spanning 64 by 102 pixels.
; PLAN: r0=264(x), r1=12(y), r2=64(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 12
LDI r2, 64
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
