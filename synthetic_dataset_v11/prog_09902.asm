; DESCRIPTION: Places a purple 19x16 rectangle at position (199, 92).
; PLAN: r0=199(x), r1=92(y), r2=19(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 92
LDI r2, 19
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
