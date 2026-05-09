; DESCRIPTION: Places a purple 56x34 rectangle at position (0, 196).
; PLAN: r0=0(x), r1=196(y), r2=56(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 196
LDI r2, 56
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
