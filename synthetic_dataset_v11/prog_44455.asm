; DESCRIPTION: Places a purple 44x63 rectangle at position (47, 168).
; PLAN: r0=47(x), r1=168(y), r2=44(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 168
LDI r2, 44
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
