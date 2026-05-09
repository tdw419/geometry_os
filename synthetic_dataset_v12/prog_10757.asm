; DESCRIPTION: Places a blue 17x21 rectangle at position (56, 208).
; PLAN: r0=56(x), r1=208(y), r2=17(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 208
LDI r2, 17
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
