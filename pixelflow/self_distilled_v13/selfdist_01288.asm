; DESCRIPTION: Creates a blue diamond shape using 4 lines meeting at the center.
; PLAN: r0=4(x), r1=4(y), r2=49(width), r3=1(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 4
LDI r2, 49
LDI r3, 1
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
