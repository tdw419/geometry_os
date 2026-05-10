; DESCRIPTION: Places a black 99x31 rectangle at position (371, 51).
; PLAN: r0=371(x), r1=51(y), r2=99(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 51
LDI r2, 99
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
