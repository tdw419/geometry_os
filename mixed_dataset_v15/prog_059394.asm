; DESCRIPTION: Places a purple 82x84 rectangle at position (172, 46).
; PLAN: r0=172(x), r1=46(y), r2=82(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 46
LDI r2, 82
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
