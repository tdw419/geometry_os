; DESCRIPTION: Places a purple 84x48 rectangle at position (133, 146).
; PLAN: r0=133(x), r1=146(y), r2=84(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 146
LDI r2, 84
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
