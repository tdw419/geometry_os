; DESCRIPTION: Places a purple 102x41 rectangle at position (141, 205).
; PLAN: r0=141(x), r1=205(y), r2=102(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 205
LDI r2, 102
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
