; DESCRIPTION: Places a purple 95x44 rectangle at position (7, 18).
; PLAN: r0=7(x), r1=18(y), r2=95(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 18
LDI r2, 95
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
