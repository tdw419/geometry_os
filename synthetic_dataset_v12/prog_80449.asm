; DESCRIPTION: Places a purple 71x25 rectangle at position (3, 2).
; PLAN: r0=3(x), r1=2(y), r2=71(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 2
LDI r2, 71
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
