; DESCRIPTION: Places a purple 112x55 rectangle at position (104, 134).
; PLAN: r0=104(x), r1=134(y), r2=112(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 134
LDI r2, 112
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
