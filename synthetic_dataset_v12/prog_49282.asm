; DESCRIPTION: Places a purple 94x99 rectangle at position (199, 50).
; PLAN: r0=199(x), r1=50(y), r2=94(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 50
LDI r2, 94
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
