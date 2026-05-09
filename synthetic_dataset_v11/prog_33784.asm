; DESCRIPTION: Places a green 80x30 rectangle at position (0, 81).
; PLAN: r0=0(x), r1=81(y), r2=80(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 81
LDI r2, 80
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
