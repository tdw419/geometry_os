; DESCRIPTION: Places a purple 91x32 rectangle at position (311, 82).
; PLAN: r0=311(x), r1=82(y), r2=91(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 82
LDI r2, 91
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
