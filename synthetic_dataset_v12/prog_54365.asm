; DESCRIPTION: Renders a yellow box of size 114x115 starting at (271, 75).
; PLAN: r0=271(x), r1=75(y), r2=114(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 75
LDI r2, 114
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
