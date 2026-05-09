; DESCRIPTION: Places a purple 66x120 rectangle at position (172, 17).
; PLAN: r0=172(x), r1=17(y), r2=66(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 17
LDI r2, 66
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
