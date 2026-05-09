; DESCRIPTION: Places a purple 71x18 rectangle at position (437, 77).
; PLAN: r0=437(x), r1=77(y), r2=71(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 77
LDI r2, 71
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
