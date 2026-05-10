; DESCRIPTION: Places a yellow 105x31 box at position (276, 28).
; PLAN: r0=276(x), r1=28(y), r2=105(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 28
LDI r2, 105
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
