; DESCRIPTION: Places a purple 120x28 box at position (287, 172).
; PLAN: r0=287(x), r1=172(y), r2=120(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 172
LDI r2, 120
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
