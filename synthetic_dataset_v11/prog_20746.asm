; DESCRIPTION: Places a black 31x99 rectangle at position (135, 32).
; PLAN: r0=135(x), r1=32(y), r2=31(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 32
LDI r2, 31
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
