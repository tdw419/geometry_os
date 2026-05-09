; DESCRIPTION: Places a black 82x110 rectangle at position (131, 50).
; PLAN: r0=131(x), r1=50(y), r2=82(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 50
LDI r2, 82
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
