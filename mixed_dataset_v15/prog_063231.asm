; DESCRIPTION: Places a purple 77x45 box at position (277, 74).
; PLAN: r0=277(x), r1=74(y), r2=77(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 74
LDI r2, 77
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
