; DESCRIPTION: Places a green 89x65 rectangle at position (407, 89).
; PLAN: r0=407(x), r1=89(y), r2=89(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 89
LDI r2, 89
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
