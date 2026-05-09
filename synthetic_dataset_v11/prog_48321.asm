; DESCRIPTION: Places a purple 10x21 rectangle at position (53, 52).
; PLAN: r0=53(x), r1=52(y), r2=10(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 52
LDI r2, 10
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
