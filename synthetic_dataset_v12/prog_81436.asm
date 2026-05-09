; DESCRIPTION: Places a yellow 73x112 rectangle at position (65, 110).
; PLAN: r0=65(x), r1=110(y), r2=73(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 110
LDI r2, 73
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
