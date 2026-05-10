; DESCRIPTION: Places a yellow 21x107 box at position (141, 165).
; PLAN: r0=141(x), r1=165(y), r2=21(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 165
LDI r2, 21
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
