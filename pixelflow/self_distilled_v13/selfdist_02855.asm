; DESCRIPTION: Places a blue 120x81 box at position (149, 50).
; PLAN: r0=149(x), r1=50(y), r2=120(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 50
LDI r2, 120
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
