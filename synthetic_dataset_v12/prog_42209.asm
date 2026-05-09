; DESCRIPTION: Places a purple 91x14 rectangle at position (123, 164).
; PLAN: r0=123(x), r1=164(y), r2=91(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 164
LDI r2, 91
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
