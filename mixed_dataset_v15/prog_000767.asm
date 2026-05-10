; DESCRIPTION: Places a purple 103x101 rectangle at position (191, 44).
; PLAN: r0=191(x), r1=44(y), r2=103(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 44
LDI r2, 103
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
