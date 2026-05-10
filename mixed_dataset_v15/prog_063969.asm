; DESCRIPTION: Places a purple 24x76 rectangle at position (199, 131).
; PLAN: r0=199(x), r1=131(y), r2=24(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 131
LDI r2, 24
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
