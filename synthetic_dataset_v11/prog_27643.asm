; DESCRIPTION: Places a purple 45x31 rectangle at position (81, 186).
; PLAN: r0=81(x), r1=186(y), r2=45(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 186
LDI r2, 45
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
