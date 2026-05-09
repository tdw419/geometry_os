; DESCRIPTION: Creates a purple rectangular region at (45, 58) spanning 62 by 50 pixels.
; PLAN: r0=45(x), r1=58(y), r2=62(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 58
LDI r2, 62
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
