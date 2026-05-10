; DESCRIPTION: Places a green 117x18 rectangle at position (23, 216).
; PLAN: r0=23(x), r1=216(y), r2=117(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 216
LDI r2, 117
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
