; DESCRIPTION: Places a yellow 13x94 rectangle at position (336, 45).
; PLAN: r0=336(x), r1=45(y), r2=13(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 45
LDI r2, 13
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
