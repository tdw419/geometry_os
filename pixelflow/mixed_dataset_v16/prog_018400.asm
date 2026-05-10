; DESCRIPTION: Places a green 23x81 rectangle at position (436, 52).
; PLAN: r0=436(x), r1=52(y), r2=23(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 52
LDI r2, 23
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
