; DESCRIPTION: Places a green 87x84 rectangle at position (66, 172).
; PLAN: r0=66(x), r1=172(y), r2=87(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 172
LDI r2, 87
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
