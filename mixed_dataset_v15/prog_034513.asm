; DESCRIPTION: Creates a purple rectangular region at (141, 63) spanning 61 by 68 pixels.
; PLAN: r0=141(x), r1=63(y), r2=61(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 63
LDI r2, 61
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
