; DESCRIPTION: Places a green 45x91 rectangle at position (131, 158).
; PLAN: r0=131(x), r1=158(y), r2=45(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 158
LDI r2, 45
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
