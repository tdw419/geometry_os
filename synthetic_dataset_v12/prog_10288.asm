; DESCRIPTION: Places a blue 14x75 rectangle at position (236, 13).
; PLAN: r0=236(x), r1=13(y), r2=14(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 13
LDI r2, 14
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
