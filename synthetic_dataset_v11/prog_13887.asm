; DESCRIPTION: Places a purple 71x106 rectangle at position (165, 36).
; PLAN: r0=165(x), r1=36(y), r2=71(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 36
LDI r2, 71
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
