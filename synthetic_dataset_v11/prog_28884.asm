; DESCRIPTION: Places a purple 55x117 rectangle at position (8, 77).
; PLAN: r0=8(x), r1=77(y), r2=55(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 77
LDI r2, 55
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
