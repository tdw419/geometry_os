; DESCRIPTION: Places a purple 12x52 rectangle at position (385, 4).
; PLAN: r0=385(x), r1=4(y), r2=12(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 4
LDI r2, 12
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
