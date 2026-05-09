; DESCRIPTION: Places a yellow 76x87 rectangle at position (110, 131).
; PLAN: r0=110(x), r1=131(y), r2=76(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 131
LDI r2, 76
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
