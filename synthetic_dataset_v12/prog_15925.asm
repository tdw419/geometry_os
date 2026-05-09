; DESCRIPTION: Places a yellow 17x50 rectangle at position (440, 89).
; PLAN: r0=440(x), r1=89(y), r2=17(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 89
LDI r2, 17
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
