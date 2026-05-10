; DESCRIPTION: Creates a purple rectangular region at (36, 0) spanning 31 by 50 pixels.
; PLAN: r0=36(x), r1=0(y), r2=31(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 0
LDI r2, 31
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
