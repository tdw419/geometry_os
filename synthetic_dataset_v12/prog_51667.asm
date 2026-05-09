; DESCRIPTION: Places a yellow 114x37 rectangle at position (322, 4).
; PLAN: r0=322(x), r1=4(y), r2=114(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 4
LDI r2, 114
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
