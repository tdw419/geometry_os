; DESCRIPTION: Renders a yellow box of size 98x70 starting at (2, 118).
; PLAN: r0=2(x), r1=118(y), r2=98(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 118
LDI r2, 98
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
