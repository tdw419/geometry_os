; DESCRIPTION: Renders a yellow box of size 104x89 starting at (98, 162).
; PLAN: r0=98(x), r1=162(y), r2=104(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 162
LDI r2, 104
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
