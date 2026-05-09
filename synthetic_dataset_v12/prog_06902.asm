; DESCRIPTION: Creates a purple rectangular region at (36, 154) spanning 14 by 45 pixels.
; PLAN: r0=36(x), r1=154(y), r2=14(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 154
LDI r2, 14
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
