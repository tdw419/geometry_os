; DESCRIPTION: Creates a green filled rectangle of size 53x104 starting at (315, 19).
; PLAN: r0=315(x), r1=19(y), r2=53(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 19
LDI r2, 53
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
