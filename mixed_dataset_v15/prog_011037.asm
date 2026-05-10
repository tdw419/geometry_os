; DESCRIPTION: Places a blue 112x18 rectangle at position (326, 40).
; PLAN: r0=326(x), r1=40(y), r2=112(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 40
LDI r2, 112
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
