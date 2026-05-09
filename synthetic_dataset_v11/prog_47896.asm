; DESCRIPTION: Places a red 94x56 rectangle at position (131, 49).
; PLAN: r0=131(x), r1=49(y), r2=94(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 49
LDI r2, 94
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
