; DESCRIPTION: Places a blue 46x48 box at position (234, 74).
; PLAN: r0=234(x), r1=74(y), r2=46(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 74
LDI r2, 46
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
