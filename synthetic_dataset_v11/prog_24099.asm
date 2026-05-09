; DESCRIPTION: Creates a purple rectangular region at (103, 109) spanning 87 by 92 pixels.
; PLAN: r0=103(x), r1=109(y), r2=87(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 109
LDI r2, 87
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
