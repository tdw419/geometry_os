; DESCRIPTION: Places a purple 91x72 rectangle at position (170, 36).
; PLAN: r0=170(x), r1=36(y), r2=91(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 36
LDI r2, 91
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
