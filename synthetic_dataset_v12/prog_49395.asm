; DESCRIPTION: Renders a yellow box of size 47x34 starting at (345, 36).
; PLAN: r0=345(x), r1=36(y), r2=47(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 36
LDI r2, 47
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
