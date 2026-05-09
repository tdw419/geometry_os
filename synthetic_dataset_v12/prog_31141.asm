; DESCRIPTION: Places a green 21x57 rectangle at position (83, 133).
; PLAN: r0=83(x), r1=133(y), r2=21(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 133
LDI r2, 21
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
