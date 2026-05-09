; DESCRIPTION: Places a yellow 45x84 rectangle at position (46, 94).
; PLAN: r0=46(x), r1=94(y), r2=45(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 94
LDI r2, 45
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
