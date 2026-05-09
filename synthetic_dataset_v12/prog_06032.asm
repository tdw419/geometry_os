; DESCRIPTION: Places a green 23x101 rectangle at position (9, 124).
; PLAN: r0=9(x), r1=124(y), r2=23(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 124
LDI r2, 23
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
