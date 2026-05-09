; DESCRIPTION: Creates a purple rectangular region at (345, 68) spanning 87 by 53 pixels.
; PLAN: r0=345(x), r1=68(y), r2=87(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 68
LDI r2, 87
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
