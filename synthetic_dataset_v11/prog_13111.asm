; DESCRIPTION: Places a purple 48x12 rectangle at position (151, 22).
; PLAN: r0=151(x), r1=22(y), r2=48(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 22
LDI r2, 48
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
