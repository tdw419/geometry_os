; DESCRIPTION: Places a purple 16x112 rectangle at position (181, 7).
; PLAN: r0=181(x), r1=7(y), r2=16(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 7
LDI r2, 16
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
