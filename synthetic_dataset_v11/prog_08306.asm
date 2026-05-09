; DESCRIPTION: Places a purple 89x52 rectangle at position (103, 188).
; PLAN: r0=103(x), r1=188(y), r2=89(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 188
LDI r2, 89
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
