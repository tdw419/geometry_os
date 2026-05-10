; DESCRIPTION: Places a purple 46x90 box at position (288, 53).
; PLAN: r0=288(x), r1=53(y), r2=46(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 53
LDI r2, 46
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
