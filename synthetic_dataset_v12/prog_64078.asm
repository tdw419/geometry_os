; DESCRIPTION: Places a purple 17x68 rectangle at position (372, 162).
; PLAN: r0=372(x), r1=162(y), r2=17(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 162
LDI r2, 17
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
