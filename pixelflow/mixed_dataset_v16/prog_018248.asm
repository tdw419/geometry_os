; DESCRIPTION: Places a purple 41x98 rectangle at position (465, 157).
; PLAN: r0=465(x), r1=157(y), r2=41(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 157
LDI r2, 41
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
