; DESCRIPTION: Places a purple 79x12 rectangle at position (218, 77).
; PLAN: r0=218(x), r1=77(y), r2=79(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 77
LDI r2, 79
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
