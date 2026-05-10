; DESCRIPTION: Places a purple 91x117 rectangle at position (253, 74).
; PLAN: r0=253(x), r1=74(y), r2=91(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 74
LDI r2, 91
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
