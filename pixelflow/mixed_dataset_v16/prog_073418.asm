; DESCRIPTION: Creates a purple rectangular region at (328, 73) spanning 44 by 13 pixels.
; PLAN: r0=328(x), r1=73(y), r2=44(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 73
LDI r2, 44
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
