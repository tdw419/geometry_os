; DESCRIPTION: Places a purple 56x76 rectangle at position (112, 127).
; PLAN: r0=112(x), r1=127(y), r2=56(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 127
LDI r2, 56
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
