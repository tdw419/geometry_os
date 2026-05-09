; DESCRIPTION: Creates a purple rectangular region at (356, 47) spanning 66 by 53 pixels.
; PLAN: r0=356(x), r1=47(y), r2=66(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 47
LDI r2, 66
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
