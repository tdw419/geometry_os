; DESCRIPTION: Places a purple 104x64 box at position (69, 10).
; PLAN: r0=69(x), r1=10(y), r2=104(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 10
LDI r2, 104
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
