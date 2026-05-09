; DESCRIPTION: Places a purple 67x92 rectangle at position (229, 79).
; PLAN: r0=229(x), r1=79(y), r2=67(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 79
LDI r2, 67
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
