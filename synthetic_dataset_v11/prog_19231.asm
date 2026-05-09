; DESCRIPTION: Places a green 33x15 rectangle at position (94, 191).
; PLAN: r0=94(x), r1=191(y), r2=33(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 191
LDI r2, 33
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
