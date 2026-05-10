; DESCRIPTION: Places a blue 80x107 box at position (262, 134).
; PLAN: r0=262(x), r1=134(y), r2=80(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 134
LDI r2, 80
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
