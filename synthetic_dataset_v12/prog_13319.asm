; DESCRIPTION: Places a purple 117x95 rectangle at position (60, 105).
; PLAN: r0=60(x), r1=105(y), r2=117(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 105
LDI r2, 117
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
