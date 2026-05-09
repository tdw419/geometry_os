; DESCRIPTION: Places a green 115x85 rectangle at position (27, 53).
; PLAN: r0=27(x), r1=53(y), r2=115(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 53
LDI r2, 115
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
