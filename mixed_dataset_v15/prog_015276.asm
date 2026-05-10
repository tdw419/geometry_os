; DESCRIPTION: Places a green 94x74 rectangle at position (124, 100).
; PLAN: r0=124(x), r1=100(y), r2=94(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 100
LDI r2, 94
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
