; DESCRIPTION: Places a purple 11x117 rectangle at position (77, 16).
; PLAN: r0=77(x), r1=16(y), r2=11(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 16
LDI r2, 11
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
