; DESCRIPTION: Places a purple 52x85 rectangle at position (414, 77).
; PLAN: r0=414(x), r1=77(y), r2=52(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 77
LDI r2, 52
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
