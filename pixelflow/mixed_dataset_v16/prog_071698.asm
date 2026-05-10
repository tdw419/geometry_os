; DESCRIPTION: Places a yellow 20x94 box at position (354, 82).
; PLAN: r0=354(x), r1=82(y), r2=20(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 82
LDI r2, 20
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
