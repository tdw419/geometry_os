; DESCRIPTION: Creates a green filled rectangle of size 106x104 starting at (233, 164).
; PLAN: r0=233(x), r1=164(y), r2=106(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 164
LDI r2, 106
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
