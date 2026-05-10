; DESCRIPTION: Places a black 119x117 rectangle at position (81, 91).
; PLAN: r0=81(x), r1=91(y), r2=119(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 91
LDI r2, 119
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
