; DESCRIPTION: Creates a green filled rectangle of size 104x69 starting at (110, 36).
; PLAN: r0=110(x), r1=36(y), r2=104(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 36
LDI r2, 104
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
