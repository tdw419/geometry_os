; DESCRIPTION: Places a black 68x44 rectangle at position (110, 160).
; PLAN: r0=110(x), r1=160(y), r2=68(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 160
LDI r2, 68
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
