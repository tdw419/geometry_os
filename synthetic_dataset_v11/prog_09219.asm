; DESCRIPTION: Places a purple 65x117 rectangle at position (183, 21).
; PLAN: r0=183(x), r1=21(y), r2=65(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 21
LDI r2, 65
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
