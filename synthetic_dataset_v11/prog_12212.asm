; DESCRIPTION: Places a yellow 118x11 rectangle at position (18, 22).
; PLAN: r0=18(x), r1=22(y), r2=118(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 22
LDI r2, 118
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
