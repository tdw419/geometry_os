; DESCRIPTION: Places a purple 31x112 rectangle at position (341, 91).
; PLAN: r0=341(x), r1=91(y), r2=31(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 91
LDI r2, 31
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
