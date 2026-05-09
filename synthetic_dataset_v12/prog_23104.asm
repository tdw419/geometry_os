; DESCRIPTION: Places a purple 93x45 rectangle at position (316, 210).
; PLAN: r0=316(x), r1=210(y), r2=93(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 210
LDI r2, 93
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
