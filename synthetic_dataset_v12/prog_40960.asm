; DESCRIPTION: Places a yellow 115x11 rectangle at position (145, 20).
; PLAN: r0=145(x), r1=20(y), r2=115(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 20
LDI r2, 115
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
