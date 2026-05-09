; DESCRIPTION: Places a purple 106x120 rectangle at position (200, 102).
; PLAN: r0=200(x), r1=102(y), r2=106(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 102
LDI r2, 106
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
