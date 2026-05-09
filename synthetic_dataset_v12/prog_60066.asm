; DESCRIPTION: Places a purple 40x100 rectangle at position (54, 17).
; PLAN: r0=54(x), r1=17(y), r2=40(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 17
LDI r2, 40
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
