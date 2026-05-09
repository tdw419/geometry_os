; DESCRIPTION: Places a purple 63x72 rectangle at position (146, 63).
; PLAN: r0=146(x), r1=63(y), r2=63(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 63
LDI r2, 63
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
