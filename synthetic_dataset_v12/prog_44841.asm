; DESCRIPTION: Places a purple 46x84 rectangle at position (180, 123).
; PLAN: r0=180(x), r1=123(y), r2=46(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 123
LDI r2, 46
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
