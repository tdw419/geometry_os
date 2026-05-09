; DESCRIPTION: Places a green 60x40 rectangle at position (337, 1).
; PLAN: r0=337(x), r1=1(y), r2=60(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 1
LDI r2, 60
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
