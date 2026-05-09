; DESCRIPTION: Renders a yellow box of size 57x109 starting at (114, 13).
; PLAN: r0=114(x), r1=13(y), r2=57(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 13
LDI r2, 57
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
