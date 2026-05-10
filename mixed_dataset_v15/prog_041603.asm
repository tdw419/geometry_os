; DESCRIPTION: Places a yellow 23x112 rectangle at position (332, 96).
; PLAN: r0=332(x), r1=96(y), r2=23(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 96
LDI r2, 23
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
