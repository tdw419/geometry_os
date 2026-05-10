; DESCRIPTION: Places a purple 18x95 rectangle at position (227, 56).
; PLAN: r0=227(x), r1=56(y), r2=18(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 56
LDI r2, 18
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
