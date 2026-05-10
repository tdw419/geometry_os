; DESCRIPTION: Creates a green filled rectangle of size 104x18 starting at (188, 115).
; PLAN: r0=188(x), r1=115(y), r2=104(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 115
LDI r2, 104
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
