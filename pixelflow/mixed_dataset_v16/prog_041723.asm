; DESCRIPTION: Places a purple 78x52 rectangle at position (143, 9).
; PLAN: r0=143(x), r1=9(y), r2=78(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 9
LDI r2, 78
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
