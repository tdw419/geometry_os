; DESCRIPTION: Places a green 105x63 rectangle at position (203, 132).
; PLAN: r0=203(x), r1=132(y), r2=105(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 132
LDI r2, 105
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
