; DESCRIPTION: Places a purple 117x98 rectangle at position (360, 148).
; PLAN: r0=360(x), r1=148(y), r2=117(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 148
LDI r2, 117
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
