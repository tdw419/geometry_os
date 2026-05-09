; DESCRIPTION: Places a black 24x102 rectangle at position (89, 82).
; PLAN: r0=89(x), r1=82(y), r2=24(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 82
LDI r2, 24
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
