; DESCRIPTION: Places a purple 41x56 rectangle at position (277, 77).
; PLAN: r0=277(x), r1=77(y), r2=41(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 77
LDI r2, 41
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
