; DESCRIPTION: Places a yellow 97x104 rectangle at position (106, 74).
; PLAN: r0=106(x), r1=74(y), r2=97(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 74
LDI r2, 97
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
