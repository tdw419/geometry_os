; DESCRIPTION: Places a blue 85x111 box at position (396, 40).
; PLAN: r0=396(x), r1=40(y), r2=85(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 40
LDI r2, 85
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
