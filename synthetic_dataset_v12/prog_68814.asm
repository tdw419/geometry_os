; DESCRIPTION: Places a purple 13x80 rectangle at position (92, 22).
; PLAN: r0=92(x), r1=22(y), r2=13(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 22
LDI r2, 13
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
