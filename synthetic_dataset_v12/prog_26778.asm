; DESCRIPTION: Places a blue 60x28 rectangle at position (117, 129).
; PLAN: r0=117(x), r1=129(y), r2=60(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 129
LDI r2, 60
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
