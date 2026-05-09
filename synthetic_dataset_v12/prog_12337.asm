; DESCRIPTION: Places a black 109x115 rectangle at position (304, 82).
; PLAN: r0=304(x), r1=82(y), r2=109(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 82
LDI r2, 109
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
