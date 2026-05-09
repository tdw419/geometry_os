; DESCRIPTION: Places a green 31x12 rectangle at position (396, 2).
; PLAN: r0=396(x), r1=2(y), r2=31(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 2
LDI r2, 31
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
