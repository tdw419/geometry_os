; DESCRIPTION: Places a green 28x94 rectangle at position (2, 131).
; PLAN: r0=2(x), r1=131(y), r2=28(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 131
LDI r2, 28
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
