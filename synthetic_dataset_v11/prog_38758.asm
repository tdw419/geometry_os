; DESCRIPTION: Places a black 28x44 rectangle at position (201, 79).
; PLAN: r0=201(x), r1=79(y), r2=28(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 79
LDI r2, 28
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
