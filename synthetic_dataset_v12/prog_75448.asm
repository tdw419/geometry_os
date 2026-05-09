; DESCRIPTION: Places a yellow 35x73 rectangle at position (112, 13).
; PLAN: r0=112(x), r1=13(y), r2=35(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 13
LDI r2, 35
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
