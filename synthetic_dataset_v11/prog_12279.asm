; DESCRIPTION: Renders a yellow box of size 95x94 starting at (20, 140).
; PLAN: r0=20(x), r1=140(y), r2=95(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 140
LDI r2, 95
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
