; DESCRIPTION: Renders a yellow box of size 31x74 starting at (23, 40).
; PLAN: r0=23(x), r1=40(y), r2=31(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 40
LDI r2, 31
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
