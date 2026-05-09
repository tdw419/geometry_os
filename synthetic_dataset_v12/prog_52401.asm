; DESCRIPTION: Places a purple 77x63 rectangle at position (146, 170).
; PLAN: r0=146(x), r1=170(y), r2=77(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 170
LDI r2, 77
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
