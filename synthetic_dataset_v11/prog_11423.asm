; DESCRIPTION: Places a green 93x53 rectangle at position (23, 86).
; PLAN: r0=23(x), r1=86(y), r2=93(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 86
LDI r2, 93
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
