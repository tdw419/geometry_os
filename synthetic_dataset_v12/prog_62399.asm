; DESCRIPTION: Places a purple 35x59 rectangle at position (174, 81).
; PLAN: r0=174(x), r1=81(y), r2=35(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 81
LDI r2, 35
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
