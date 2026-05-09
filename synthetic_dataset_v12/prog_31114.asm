; DESCRIPTION: Places a green 53x117 rectangle at position (399, 119).
; PLAN: r0=399(x), r1=119(y), r2=53(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 119
LDI r2, 53
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
