; DESCRIPTION: Places a black 80x93 rectangle at position (103, 37).
; PLAN: r0=103(x), r1=37(y), r2=80(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 37
LDI r2, 80
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
