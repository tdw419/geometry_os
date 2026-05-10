; DESCRIPTION: Places a purple 30x89 box at position (400, 92).
; PLAN: r0=400(x), r1=92(y), r2=30(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 92
LDI r2, 30
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
