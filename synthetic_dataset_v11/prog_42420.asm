; DESCRIPTION: Places a black 60x73 rectangle at position (57, 124).
; PLAN: r0=57(x), r1=124(y), r2=60(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 124
LDI r2, 60
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
