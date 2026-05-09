; DESCRIPTION: Creates a purple rectangular region at (417, 131) spanning 69 by 60 pixels.
; PLAN: r0=417(x), r1=131(y), r2=69(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 131
LDI r2, 69
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
