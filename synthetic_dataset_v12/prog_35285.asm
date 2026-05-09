; DESCRIPTION: Places a green 53x48 rectangle at position (93, 160).
; PLAN: r0=93(x), r1=160(y), r2=53(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 160
LDI r2, 53
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
