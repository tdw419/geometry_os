; DESCRIPTION: Places a blue 31x56 rectangle at position (350, 1).
; PLAN: r0=350(x), r1=1(y), r2=31(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 1
LDI r2, 31
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
