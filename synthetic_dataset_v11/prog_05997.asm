; DESCRIPTION: Places a blue 80x72 rectangle at position (129, 8).
; PLAN: r0=129(x), r1=8(y), r2=80(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 8
LDI r2, 80
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
