; DESCRIPTION: Places a yellow 115x104 rectangle at position (33, 112).
; PLAN: r0=33(x), r1=112(y), r2=115(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 112
LDI r2, 115
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
