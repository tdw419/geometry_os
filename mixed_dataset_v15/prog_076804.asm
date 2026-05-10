; DESCRIPTION: Places a purple 89x10 rectangle at position (329, 28).
; PLAN: r0=329(x), r1=28(y), r2=89(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 28
LDI r2, 89
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
