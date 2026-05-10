; DESCRIPTION: Places a blue 10x52 box at position (373, 35).
; PLAN: r0=373(x), r1=35(y), r2=10(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 35
LDI r2, 10
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
