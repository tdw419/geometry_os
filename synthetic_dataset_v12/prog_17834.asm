; DESCRIPTION: Places a purple 65x16 rectangle at position (41, 233).
; PLAN: r0=41(x), r1=233(y), r2=65(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 233
LDI r2, 65
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
