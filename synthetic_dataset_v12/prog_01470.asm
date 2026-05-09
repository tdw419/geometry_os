; DESCRIPTION: Places a blue 56x66 rectangle at position (21, 179).
; PLAN: r0=21(x), r1=179(y), r2=56(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 179
LDI r2, 56
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
