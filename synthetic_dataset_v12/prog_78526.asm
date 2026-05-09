; DESCRIPTION: Places a purple 41x92 rectangle at position (24, 96).
; PLAN: r0=24(x), r1=96(y), r2=41(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 96
LDI r2, 41
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
