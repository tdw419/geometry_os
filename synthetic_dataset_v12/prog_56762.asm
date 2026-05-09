; DESCRIPTION: Places a green 28x13 rectangle at position (133, 114).
; PLAN: r0=133(x), r1=114(y), r2=28(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 114
LDI r2, 28
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
