; DESCRIPTION: Places a purple 111x84 rectangle at position (211, 80).
; PLAN: r0=211(x), r1=80(y), r2=111(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 80
LDI r2, 111
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
