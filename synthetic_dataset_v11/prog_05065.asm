; DESCRIPTION: Places a purple 33x40 rectangle at position (7, 2).
; PLAN: r0=7(x), r1=2(y), r2=33(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 2
LDI r2, 33
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
