; DESCRIPTION: Places a purple 113x19 box at position (17, 85).
; PLAN: r0=17(x), r1=85(y), r2=113(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 85
LDI r2, 113
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
