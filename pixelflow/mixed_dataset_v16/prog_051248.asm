; DESCRIPTION: Places a purple 14x89 rectangle at position (398, 92).
; PLAN: r0=398(x), r1=92(y), r2=14(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 92
LDI r2, 14
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
