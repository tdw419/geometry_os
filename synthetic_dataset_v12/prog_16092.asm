; DESCRIPTION: Places a green 57x106 rectangle at position (333, 64).
; PLAN: r0=333(x), r1=64(y), r2=57(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 64
LDI r2, 57
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
