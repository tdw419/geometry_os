; DESCRIPTION: Places a green 100x19 rectangle at position (56, 132).
; PLAN: r0=56(x), r1=132(y), r2=100(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 132
LDI r2, 100
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
