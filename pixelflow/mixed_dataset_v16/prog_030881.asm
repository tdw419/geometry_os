; DESCRIPTION: Creates a green filled rectangle of size 104x119 starting at (209, 52).
; PLAN: r0=209(x), r1=52(y), r2=104(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 52
LDI r2, 104
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
