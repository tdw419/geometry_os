; DESCRIPTION: Places a green 73x26 rectangle at position (83, 21).
; PLAN: r0=83(x), r1=21(y), r2=73(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 21
LDI r2, 73
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
