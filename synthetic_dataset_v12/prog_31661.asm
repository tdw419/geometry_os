; DESCRIPTION: Places a purple 115x38 rectangle at position (80, 140).
; PLAN: r0=80(x), r1=140(y), r2=115(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 140
LDI r2, 115
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
