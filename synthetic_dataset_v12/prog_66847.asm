; DESCRIPTION: Places a purple 102x89 rectangle at position (218, 48).
; PLAN: r0=218(x), r1=48(y), r2=102(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 48
LDI r2, 102
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
