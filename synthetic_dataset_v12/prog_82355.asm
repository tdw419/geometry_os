; DESCRIPTION: Places a purple 111x19 rectangle at position (314, 21).
; PLAN: r0=314(x), r1=21(y), r2=111(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 21
LDI r2, 111
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
