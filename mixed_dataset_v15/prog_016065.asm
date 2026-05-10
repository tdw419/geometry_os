; DESCRIPTION: Places a blue 13x20 box at position (262, 200).
; PLAN: r0=262(x), r1=200(y), r2=13(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 200
LDI r2, 13
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
