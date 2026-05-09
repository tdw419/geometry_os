; DESCRIPTION: Places a green 53x80 rectangle at position (37, 109).
; PLAN: r0=37(x), r1=109(y), r2=53(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 109
LDI r2, 53
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
