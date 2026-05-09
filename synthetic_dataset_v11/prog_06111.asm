; DESCRIPTION: Renders a yellow box of size 115x30 starting at (57, 189).
; PLAN: r0=57(x), r1=189(y), r2=115(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 189
LDI r2, 115
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
