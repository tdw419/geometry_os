; DESCRIPTION: Creates a purple rectangular region at (73, 85) spanning 104 by 103 pixels.
; PLAN: r0=73(x), r1=85(y), r2=104(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 85
LDI r2, 104
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
