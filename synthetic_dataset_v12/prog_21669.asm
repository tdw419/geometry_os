; DESCRIPTION: Places a yellow 80x112 rectangle at position (194, 40).
; PLAN: r0=194(x), r1=40(y), r2=80(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 40
LDI r2, 80
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
