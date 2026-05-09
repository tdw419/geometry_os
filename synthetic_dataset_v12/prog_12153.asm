; DESCRIPTION: Places a purple 68x75 rectangle at position (105, 38).
; PLAN: r0=105(x), r1=38(y), r2=68(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 38
LDI r2, 68
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
