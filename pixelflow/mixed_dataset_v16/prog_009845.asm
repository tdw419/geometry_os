; DESCRIPTION: Places a blue 120x75 box at position (379, 25).
; PLAN: r0=379(x), r1=25(y), r2=120(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 25
LDI r2, 120
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
