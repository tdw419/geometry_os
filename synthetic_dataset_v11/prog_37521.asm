; DESCRIPTION: Places a yellow 15x58 rectangle at position (110, 80).
; PLAN: r0=110(x), r1=80(y), r2=15(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 80
LDI r2, 15
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
