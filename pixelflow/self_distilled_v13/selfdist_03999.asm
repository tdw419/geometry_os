; DESCRIPTION: Places a yellow 74x13 box at position (387, 160).
; PLAN: r0=387(x), r1=160(y), r2=74(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 160
LDI r2, 74
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
