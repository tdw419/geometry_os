; DESCRIPTION: Places a purple 95x96 rectangle at position (334, 117).
; PLAN: r0=334(x), r1=117(y), r2=95(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 117
LDI r2, 95
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
