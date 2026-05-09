; DESCRIPTION: Places a green 66x101 rectangle at position (387, 4).
; PLAN: r0=387(x), r1=4(y), r2=66(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 4
LDI r2, 66
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
