; DESCRIPTION: Places a yellow 28x36 box at position (231, 160).
; PLAN: r0=231(x), r1=160(y), r2=28(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 160
LDI r2, 28
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
