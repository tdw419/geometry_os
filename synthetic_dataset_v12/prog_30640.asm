; DESCRIPTION: Places a green 89x80 rectangle at position (25, 172).
; PLAN: r0=25(x), r1=172(y), r2=89(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 172
LDI r2, 89
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
