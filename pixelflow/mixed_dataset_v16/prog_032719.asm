; DESCRIPTION: Places a green 91x92 rectangle at position (201, 34).
; PLAN: r0=201(x), r1=34(y), r2=91(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 34
LDI r2, 91
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
