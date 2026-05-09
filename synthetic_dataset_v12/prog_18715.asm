; DESCRIPTION: Places a purple 109x11 rectangle at position (362, 212).
; PLAN: r0=362(x), r1=212(y), r2=109(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 212
LDI r2, 109
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
