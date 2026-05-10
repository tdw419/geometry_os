; DESCRIPTION: Places a blue 120x112 rectangle at position (367, 97).
; PLAN: r0=367(x), r1=97(y), r2=120(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 97
LDI r2, 120
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
