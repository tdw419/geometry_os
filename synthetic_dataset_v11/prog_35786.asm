; DESCRIPTION: Places a black 21x112 rectangle at position (89, 55).
; PLAN: r0=89(x), r1=55(y), r2=21(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 55
LDI r2, 21
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
