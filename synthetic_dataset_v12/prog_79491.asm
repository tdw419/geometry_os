; DESCRIPTION: Places a blue 10x90 rectangle at position (129, 84).
; PLAN: r0=129(x), r1=84(y), r2=10(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 84
LDI r2, 10
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
