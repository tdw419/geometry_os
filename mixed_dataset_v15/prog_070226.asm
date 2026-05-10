; DESCRIPTION: Places a yellow 21x25 box at position (399, 149).
; PLAN: r0=399(x), r1=149(y), r2=21(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 149
LDI r2, 21
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
