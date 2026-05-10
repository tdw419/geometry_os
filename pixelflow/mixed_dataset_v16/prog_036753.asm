; DESCRIPTION: Places a yellow 87x25 box at position (119, 46).
; PLAN: r0=119(x), r1=46(y), r2=87(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 46
LDI r2, 87
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
