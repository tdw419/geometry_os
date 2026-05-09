; DESCRIPTION: Places a purple 78x11 rectangle at position (74, 172).
; PLAN: r0=74(x), r1=172(y), r2=78(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 172
LDI r2, 78
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
