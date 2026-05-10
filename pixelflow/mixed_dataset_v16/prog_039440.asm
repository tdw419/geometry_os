; DESCRIPTION: Places a purple 11x59 box at position (142, 27).
; PLAN: r0=142(x), r1=27(y), r2=11(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 27
LDI r2, 11
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
