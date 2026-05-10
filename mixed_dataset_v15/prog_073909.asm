; DESCRIPTION: Places a purple 28x116 box at position (45, 161).
; PLAN: r0=45(x), r1=161(y), r2=28(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 161
LDI r2, 28
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
