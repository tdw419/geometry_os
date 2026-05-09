; DESCRIPTION: Places a purple 66x76 rectangle at position (135, 141).
; PLAN: r0=135(x), r1=141(y), r2=66(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 141
LDI r2, 66
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
