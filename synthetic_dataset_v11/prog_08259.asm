; DESCRIPTION: Places a yellow 36x106 rectangle at position (22, 17).
; PLAN: r0=22(x), r1=17(y), r2=36(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 17
LDI r2, 36
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
