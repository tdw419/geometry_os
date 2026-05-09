; DESCRIPTION: Creates a purple rectangular region at (179, 131) spanning 45 by 99 pixels.
; PLAN: r0=179(x), r1=131(y), r2=45(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 131
LDI r2, 45
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
