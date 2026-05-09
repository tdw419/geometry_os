; DESCRIPTION: Places a green 83x45 rectangle at position (353, 89).
; PLAN: r0=353(x), r1=89(y), r2=83(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 89
LDI r2, 83
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
