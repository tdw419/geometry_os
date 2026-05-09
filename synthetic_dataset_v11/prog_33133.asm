; DESCRIPTION: Places a black 111x89 rectangle at position (8, 160).
; PLAN: r0=8(x), r1=160(y), r2=111(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 160
LDI r2, 111
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
