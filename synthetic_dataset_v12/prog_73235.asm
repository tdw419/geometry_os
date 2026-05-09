; DESCRIPTION: Places a blue 13x73 rectangle at position (100, 40).
; PLAN: r0=100(x), r1=40(y), r2=13(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 40
LDI r2, 13
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
