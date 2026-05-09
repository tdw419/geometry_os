; DESCRIPTION: Places a black 50x108 rectangle at position (94, 91).
; PLAN: r0=94(x), r1=91(y), r2=50(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 91
LDI r2, 50
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
