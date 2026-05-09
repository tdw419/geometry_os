; DESCRIPTION: Places a yellow 15x97 rectangle at position (124, 0).
; PLAN: r0=124(x), r1=0(y), r2=15(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 0
LDI r2, 15
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
