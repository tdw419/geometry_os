; DESCRIPTION: Places a black 60x64 rectangle at position (363, 131).
; PLAN: r0=363(x), r1=131(y), r2=60(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 131
LDI r2, 60
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
